import Foundation
import SwiftUI
import DesignSystem

extension MovieListDetailPage {
  struct MovieCastComponent {
    let viewState: ViewState
    let tapAction: (MovieListDetailStore.State.ScopeItem) -> Void
  }
}

extension MovieListDetailPage.MovieCastComponent: View {
  var body: some View {
    HStack {
      Text("Cast")
        .font(.system(size: 16, weight: .bold))
      Text("See all")
        .foregroundColor(AppColor.Label.base3)
      
      Spacer()
    }
      .onTapGesture {
        tapAction(viewState.item)
      }

  }
}

extension MovieListDetailPage.MovieCastComponent {
  struct ViewState: Equatable {
    let item: MovieListDetailStore.State.ScopeItem
  }
}
