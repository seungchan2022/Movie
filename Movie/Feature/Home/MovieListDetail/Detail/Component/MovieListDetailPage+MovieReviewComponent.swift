import Foundation
import SwiftUI
import DesignSystem
import Platform

extension MovieListDetailPage {
  struct MovieReviewComponent {
    let viewState: ViewState
    let tapAction: () -> Void
    
  }
}

extension MovieListDetailPage.MovieReviewComponent {
  private var reviewTotalCount: Int? {
    guard let count = viewState.review?.totalResults else { return nil }
    return count
  }
}

extension MovieListDetailPage.MovieReviewComponent: View {
  var body: some View {
    VStack {
      if let reviewTotalCount = reviewTotalCount, reviewTotalCount > 0 {
        Button(action: tapAction) {
          Text("\(reviewTotalCount) reviews")
            .foregroundColor(AppColor.Label.base3)
            .frame(maxWidth: .infinity, alignment: .leading)
          
          Image(systemName: "chevron.right")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 15, height: 15)
            .foregroundColor(AppColor.Label.base2)
        }
      }
    }
  }
}

extension MovieListDetailPage.MovieReviewComponent {
  struct ViewState: Equatable {
    let review: MovieAPIModel.Detail.Review.Response?
  }
}

