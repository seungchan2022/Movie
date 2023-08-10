import Foundation
import SwiftUI
import DesignSystem
import Platform

extension MovieListDetailPage {
  struct RecommendListComponent {
    let viewState: ViewState
    let tapAction: () -> Void
  }
}

extension MovieListDetailPage.RecommendListComponent {
  var itemList: [MovieAPIModel.Detail.Recommend.Response.Item]? {
    viewState.recommend?.itemList
  }
}

extension MovieListDetailPage.RecommendListComponent {
  private func lineColor(for item: MovieAPIModel.Detail.Recommend.Response.Item) -> Color {
    if (item.voteAverage * 10) >= 75 {
      return .green
    } else if (item.voteAverage * 10) >= 50 {
      return .yellow
    } else {
      return .red
    }
  }
}

extension MovieListDetailPage.RecommendListComponent: View {
  var body: some View {
    if let itemList {
      VStack {
        Button(action: { tapAction() }) {
          HStack(spacing: 8) {
            Text("Recommend movies")
              .font(.system(size: 16, weight: .bold))
              .foregroundColor(Color(.label))
            Text("See all")
              .foregroundColor(AppColor.Label.base3)
            Spacer()
            
            Image(systemName: "chevron.right")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 10, height: 10)
              .foregroundColor(Color(.label))
              .padding(4)
          }
        }
        
        // image에 대한 버튼을 누르면 해당 선택한 사람의 프로필로 이동하도록 구현 할 것
        ScrollView(.horizontal, showsIndicators: false) {
          LazyHStack(spacing: 16) {
            ForEach(itemList) { item in
              Button(action: { tapAction() }) {
                VStack {
                  if let imageURL = item.posterPath {
                    RemoteImage(url: imageURL.imagePath)
                      .frame(width: 100, height: 140)
                      .clipShape(RoundedRectangle(cornerRadius: 10))
                  }
                  else {
                    RoundedRectangle(cornerRadius: 10)
                      .fill(.gray)
                      .frame(width: 100, height: 100)
                  }
                  
                  Text(item.title)
                    .foregroundColor(Color(.label))
                    .font(.system(size: 12, weight: .medium))
                    .frame(width: 120)
                    .lineLimit(.zero)
                    .multilineTextAlignment(.center)
                  
                  Circle()
                    .trim(from: 0, to: item.voteAverage / 10)
                    .stroke(
                      lineColor(for: item),
                      style: StrokeStyle(
                        lineWidth: 2,
                        lineCap: .round,
                        dash: [0.5, 2.5]))
                    .frame(width: 40, height: 40)
                    .rotationEffect(Angle(degrees: -90))
                    .blur(radius: 0.7)
                    .overlay {
                      Text((item.voteAverage * 10).toPercentFormat
                      )
                      .font(.system(size: 12, weight: .medium))
                    }
                }
              }
              .buttonStyle(.plain)
            }
          }
        }
      }
    } else {
      EmptyView()
    }
  }
}

extension MovieListDetailPage.RecommendListComponent {
  struct ViewState: Equatable {
    let recommend: MovieAPIModel.Detail.Recommend.Response?
  }
}

extension String {
  fileprivate var imagePath: String {
    MovieAPIConst.imageBaseURL + self
  }
}

extension Double {
  fileprivate var toPercentFormat: String {
    String(format: "%.0f", self) + "%"
  }
}

