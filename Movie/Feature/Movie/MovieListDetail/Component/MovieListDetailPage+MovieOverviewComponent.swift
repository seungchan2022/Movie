import Foundation
import SwiftUI
import DesignSystem

extension MovieListDetailPage {
  struct MovieOverviewComponent {
    let viewState: ViewState
    @State private var isOverView = false
  }
}

extension MovieListDetailPage.MovieOverviewComponent: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      Text("Overview:")
        .font(.system(size: 16, weight: .bold))
      if isOverView {
        Text(viewState.item.overview)
        Text("Less")
          .foregroundColor(AppColor.Label.base3)
      } else {
        Text(viewState.item.overview)
          .lineLimit(2)
        Text("Read More")
          .foregroundColor(AppColor.Label.base3)
      }
    }
    .onTapGesture {
      isOverView.toggle()
    }
  }
}

extension MovieListDetailPage.MovieOverviewComponent {
  struct ViewState: Equatable {
    let item: MovieListDetailStore.State.ScopeItem
    
  }
}
