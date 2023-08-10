import Foundation
import SwiftUI
import DesignSystem
import Platform

extension MovieListDetailPage {
  struct MovieKeywordsComponent {
    let viewState: ViewState
    // 나중에 눌렀을때 해당 키워드로 이동하도록
    //    let tapAction: () -> Void
    let tapAction: (MovieAPIModel.Detail.Movie.Response.Keyword) -> Void
  }
}

extension  MovieListDetailPage.MovieKeywordsComponent {
  var itemList: [MovieAPIModel.Detail.Movie.Response.Keyword]? {
    viewState.movie?.keywordBucket.keywordList
  }
}

extension MovieListDetailPage.MovieKeywordsComponent: View {
  var body: some View {
    if let itemList {
      VStack(alignment: .leading, spacing: 8) {
        Text("keywords")
          .font(.system(size: 16, weight: .bold))
          .padding(.top, 8)
        ScrollView(.horizontal, showsIndicators: false) {
          LazyHStack(spacing: 12) {
            ForEach(itemList) { item in
              Button(action: { tapAction(item) }) {
                Text(item.name)
                  .font(.system(size: 14, weight: .bold))
                Image(systemName: "chevron.right")
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(width: 10, height: 10)
              }
              .foregroundColor(Color(.label))
              .padding(4)
              
              .background(
                RoundedRectangle(cornerRadius: 10)
                  .fill(AppColor.Background.base2))
            }
          } // LazyHStack (keyword)
        }
      }
    } else {
      EmptyView()
    }
  }
}

extension MovieListDetailPage.MovieKeywordsComponent {
  struct ViewState: Equatable {
    let movie: MovieAPIModel.Detail.Movie.Response?
  }
}

