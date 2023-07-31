import Foundation
import SwiftUI
import DesignSystem

extension MovieListDetailPage {
  struct MovieReviewComponent {
    let viewState: ViewState
    let tapAction: (MovieListDetailStore.State.ScopeItem) -> Void
  }
}

extension MovieListDetailPage.MovieReviewComponent: View {
  var body: some View {
    Text(viewState.item.reviews)
      .foregroundColor(AppColor.Label.base3)
      .onTapGesture {
        tapAction(viewState.item)
      }
  }
}

extension MovieListDetailPage.MovieReviewComponent {
  struct ViewState: Equatable {
    let item: MovieListDetailStore.State.ScopeItem
  }
}
