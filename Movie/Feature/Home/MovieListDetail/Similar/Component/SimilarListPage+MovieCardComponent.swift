import Foundation
import SwiftUI
import DesignSystem
import Platform

extension SimilarListPage {
  struct MovieCardComponent {
    let viewState: ViewState
    let tapAction: (MovieAPIModel.Detail.Similar.Response.Item) -> Void
  }
}

extension SimilarListPage.MovieCardComponent {
  var itemList: [MovieAPIModel.Detail.Similar.Response.Item]? {
    viewState.movie?.itemList
  }
}

extension SimilarListPage.MovieCardComponent {
  func formatDate(_ dateString: String) -> String {
    let inputDateFormatter = DateFormatter()
    inputDateFormatter.dateFormat = "yyyy-MM-dd"
    
    let outputDateFormatter = DateFormatter()
    outputDateFormatter.dateFormat = "M/d/yy"
    
    if let date = inputDateFormatter.date(from: dateString) {
      return outputDateFormatter.string(from: date)
    } else {
      return ""
    }
  }
  
  private func lineColor(for item: MovieAPIModel.Detail.Similar.Response.Item) -> Color {
    if (item.voteAverage * 10) >= 75 {
      return .green
    } else if (item.voteAverage * 10) >= 50 {
      return .yellow
    } else {
      return .red
    }
  }
}

extension SimilarListPage.MovieCardComponent: View {
  var body: some View {
    LazyVStack {
      if let itemList {
        ForEach(itemList) { item in
          Button(action: { tapAction(item)
            print("movie id: \(item.id)")
          }) {
            HStack(spacing: 16) {
              if let imageURL = item.posterPath {
                RemoteImage(url: imageURL.imagePath)
                  .frame(width: 100, height: 160)
                  .clipShape(RoundedRectangle(cornerRadius: 10))
              }
              
              VStack(alignment: .leading, spacing: 16) {
                Spacer()
                Text(item.title)
                  .font(.system(size: 18, weight: .medium))
                  .foregroundColor(AppColor.Label.base)
                
                HStack(spacing: 10) {
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
                  
                  Text(formatDate(item.releaseDate))
                }
                .font(.system(size: 16, weight: .medium))
                
                Text(item.overView)
                  .font(.system(size: 16, weight: .medium))
                  .foregroundColor(AppColor.Label.base2)
                
                Spacer()
              }
              
              Spacer()
              
              Image(systemName: "chevron.right")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 10, height: 10)
                .foregroundColor(AppColor.Label.base2)
            }
          }
          .buttonStyle(.plain)
          .frame(height: 200)
          
          Divider()
        }
      }
    }
  }
}

extension SimilarListPage.MovieCardComponent {
  struct ViewState: Equatable {
    let movie: MovieAPIModel.Detail.Similar.Response?
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


