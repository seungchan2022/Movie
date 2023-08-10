import Foundation
import SwiftUI
import DesignSystem
import Platform

extension MovieListDetailPage {
  struct MovieOverviewComponent {
    let viewState: ViewState
    @State private var isOverView = false
  }
}

extension MovieListDetailPage.MovieOverviewComponent {
  private var overView: String? {
    viewState.movie?.overView
  }
  
  private var toggleText: String {
    isOverView ? "Read More" : "Less"
  }
}

extension MovieListDetailPage.MovieOverviewComponent: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      if let overView {
        Text("Overview:")
          .font(.system(size: 16, weight: .bold))
        
        Button(action: { isOverView.toggle() }) {
          VStack(alignment: .leading, spacing: 8) {
            Text(overView)
              .foregroundColor(AppColor.Label.base2)
              .multilineTextAlignment(.leading)
              .lineLimit(isOverView ? .max : 2)
            Text(toggleText)
              .foregroundColor(AppColor.Label.base3)
              .padding(.bottom, 8)
          }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
      }
    }
  }
}

extension MovieListDetailPage.MovieOverviewComponent {
  struct ViewState: Equatable {
    let movie: MovieAPIModel.Detail.Movie.Response?
  }
}

