import Foundation
import SwiftUI
import DesignSystem

extension MovieListDetailPage {
  struct MovieDirectorComponent {
    let viewState: ViewState
    let tapAction: (MovieListDetailStore.State.ScopeItem) -> Void
  }
}

extension MovieListDetailPage.MovieDirectorComponent: View {
  var body: some View {
    HStack {
      Text("Director: ")
        .font(.system(size: 16, weight: .bold))
      Text(viewState.item.director)
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(AppColor.Label.base2)
      
      Spacer()
    }
      .onTapGesture {
        tapAction(viewState.item)
      }

  }
}

extension MovieListDetailPage.MovieDirectorComponent {
  struct ViewState: Equatable {
    let item: MovieListDetailStore.State.ScopeItem
  }
}

