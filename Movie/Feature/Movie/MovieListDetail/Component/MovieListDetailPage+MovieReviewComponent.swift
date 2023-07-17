import Foundation
import SwiftUI

extension MovieListDetailPage {
  struct MovieReviewComponent {
    let viewState: ViewState
    let tapAction: (MovieListDetailStore.State.ScopeItem) -> Void
  }
}

extension MovieListDetailPage.MovieReviewComponent: View {
  var body: some View {
    Text(viewState.item.reviews)
      .foregroundColor(Color(.systemMint))
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
