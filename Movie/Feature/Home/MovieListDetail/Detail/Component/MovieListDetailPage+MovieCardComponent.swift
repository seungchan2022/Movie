import Foundation
import SwiftUI
import DesignSystem


extension MovieListDetailPage {
  struct MovieCardComponent {
    let viewState: ViewState
    //    let tapAction: (MovieListDetailStore.State.ScopeItem) -> Void
  }
}

extension MovieListDetailPage.MovieCardComponent {
  private var lineColor: Color {
    if viewState.item.voteAverage >= 75 {
      return .green
    } else if viewState.item.voteAverage >= 50 {
      return .yellow
    } else {
      return .red
    }
  }
}

extension MovieListDetailPage.MovieCardComponent {
  // release_date 문자열에서 년도를 추출하는 함수
  private func extractYear(from dateString: String) -> String? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    if let date = dateFormatter.date(from: dateString) {
      let calendar = Calendar.current
      let year = calendar.component(.year, from: date)
      return "\(year)"
    }
    return nil
  }
}

extension MovieListDetailPage.MovieCardComponent: View {
  var body: some View {
    VStack {
      HStack {
        RemoteImage(url: viewState.item.imageURL)
          .frame(width: 120, height: 160)
          .clipShape(RoundedRectangle(cornerRadius: 10))
        
        VStack(alignment: .leading) {
          Spacer()
          
          HStack {
            let dateString = viewState.item.releaseDate
            if let year = extractYear(from: dateString) {
              Text(year + " • ") +
              Text("\(viewState.item.runningTime) minut.. • ") +
              Text(viewState.item.status)
            }
          }
          .lineLimit(0)
          .minimumScaleFactor(0.5)
          
          if !viewState.item.country.isEmpty {
            Text(viewState.item.country[0])
              .lineLimit(0)
              .minimumScaleFactor(0.5)
          } else {
            Text("")
          }
          
          Spacer()
          
          HStack(spacing: 10) {
            ZStack {
              Circle()
                .trim(from: 0, to: CGFloat(viewState.item.voteAverage / 100))
                .stroke(
                  lineColor,
                  style: StrokeStyle(
                    lineWidth: 2,
                    lineCap: .round,
                    dash: [1, 3]))
                .rotationEffect(Angle(degrees: -90))
              
              Text("\(viewState.item.voteAverage, specifier: "%.0f")%")
                .font(.system(size: 12, weight: .medium))
                
            }
            .frame(width: 40, height: 40)
            
            Text("\(viewState.item.voteCount) ratings")
            
            Spacer()
          }
          Spacer()
        }
        .font(.system(size: 16, weight: .medium))
        .foregroundColor(.white)
        
        
      }
  // 각 영화에 맞는 장르들이 나오도록
        ScrollView(.horizontal, showsIndicators: false) {
          LazyHStack {
            ForEach(viewState.item.geners.indices, id: \.self) { index in
            Button(action: { print(viewState.item.geners[index]) }) {
              Text(viewState.item.geners[index])
                .font(.system(size: 14, weight: .bold))
              Image(systemName: "chevron.right")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 10, height: 10)
            }
          } // Forech
          .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 4))
          .background(
            RoundedRectangle(cornerRadius: 16).fill(AppColor.Background.base)
          )
            
          Spacer()
        }
      }
      .buttonStyle(.plain)
      .foregroundColor(Color(.label))
      .padding(.top, 12)
      .padding(.bottom, 12)
    }
    .padding(.top, 8)
  }
}

extension MovieListDetailPage.MovieCardComponent {
  struct ViewState: Equatable {
    let item: MovieListDetailStore.State.ScopeItem
  }
}
