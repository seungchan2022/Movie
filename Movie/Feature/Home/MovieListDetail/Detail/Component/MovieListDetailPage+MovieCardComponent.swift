import Foundation
import SwiftUI
import DesignSystem
import Platform

extension MovieListDetailPage {
  struct MovieCardComponent {
    let viewState: ViewState
    //    let tapAction: (MovieListDetailStore.State.ScopeItem) -> Void
  }
}

extension MovieListDetailPage.MovieCardComponent {
  private var lineColor: Color {
    guard let movie = viewState.movie else { return .clear }
    
      if (movie.voteAverage * 10)  >= 75 {
        return .green
      } else if (movie.voteAverage * 10)  >= 50 {
        return .yellow
      } else {
        return .red
      }
  }
  
  private var detailSubTitle: String {
    guard
      let movie = viewState.movie,
      let year = movie.releaseDate.extractYear()
    else { return "" }
    return [
      year,
      "\(movie.runtime) minut..",
      movie.status
    ]
      .compactMap { $0 }
      .joined(separator: " • ")
  }
  
  private var country: String? {
    guard
      let countryList = viewState.movie?.productionCountries,
      let pick = countryList.first
    else { return .none }
    return pick.name
  }
  
  private var voteAverage: Double? {
    guard let average = viewState.movie?.voteAverage else { return .none }
    return Double(average * 10)
  }
  
  private var voteTotalCount: Int? {
    guard let count = viewState.movie?.voteCount else { return .none }
    return count
  }
  
  private var genreItemList: [MovieAPIModel.Detail.Movie.Response.Genre]? {
    guard let list = viewState.movie?.genres else { return .none }
    return list
  }
}

extension MovieListDetailPage.MovieCardComponent: View {
  var body: some View {
    ZStack {
      if let imageURL = viewState.movie?.posterPath {
        RemoteImage(url: imageURL.imagePath)
          .frame(maxWidth: .infinity)
          .clipShape(RoundedRectangle(cornerRadius: 10))
      } else {
        EmptyView()
      }
      
      RoundedRectangle(cornerRadius: 10)
        .background(
          .ultraThinMaterial,
          in: RoundedRectangle(cornerRadius: 10, style: .continuous))
      
      RoundedRectangle(cornerRadius: 10)
        .fill(.black)
        .opacity(0.3)
      
      VStack(spacing: 8) {
        HStack {
          if let imageURL = viewState.movie?.posterPath {
            RemoteImage(url: imageURL.imagePath)
              .frame(width: 100, height: 140)
              .clipShape(RoundedRectangle(cornerRadius: 10))
          }
          
          VStack(alignment: .leading) {
            Spacer()
            
            HStack {
              Text(detailSubTitle)
            }
            .lineLimit(0)
            .minimumScaleFactor(0.99)
            
            if let country {
              Text(country)
                .lineLimit(0)
            }
            
            Spacer()
            
            HStack(spacing: 10) {
              if let voteAverage {
                Circle()
                  .trim(from: 0, to: voteAverage / 100)
                  .stroke(
                    lineColor,
                    style: StrokeStyle(
                      lineWidth: 2,
                      lineCap: .round,
                      dash: [0.5, 2.5]))
                  .frame(width: 40, height: 40)
                  .rotationEffect(Angle(degrees: -90))
                  .blur(radius: 0.7)
                  .overlay {
                    Text(voteAverage.toPercentFormat)
                      .font(.system(size: 12, weight: .medium))
                  }
              }
              
              if let voteTotalCount {
                Text("\(voteTotalCount) ratings")
                  .font(.system(size: 18, weight: .medium))
              }
              
              Spacer()
            }
            Spacer()
          }
          .font(.system(size: 16, weight: .medium))
          .foregroundColor(.white)
        }
        
        Spacer()
        
        // 각 영화에 맞는 장르들이 나오도록
        if let genreItemList {
          ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 8) {
              ForEach(genreItemList) { item in
                Button( action: { print(item) }) {
                  Text(item.name)
                    .font(.system(size: 14, weight: .medium))
                  Image(systemName: "chevron.right")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 10, height: 10)
                }
                .foregroundColor(Color(.label))
                .padding(8)
                .background(
                  RoundedRectangle(cornerRadius: 16).fill(AppColor.Background.base)
                )
              }
            }
          }
        }
        
        Spacer()
      }
      .padding(18)
    }
  }
}

extension MovieListDetailPage.MovieCardComponent {
  struct ViewState: Equatable {
    let movie: MovieAPIModel.Detail.Movie.Response?
  }
}

extension String {
  // release_date 문자열에서 년도를 추출하는 함수
  fileprivate func extractYear() -> String? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    if let date = dateFormatter.date(from: self) {
      let calendar = Calendar.current
      let year = calendar.component(.year, from: date)
      return "\(year)"
    }
    return nil
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

