import Foundation
import SwiftUI
import DesignSystem

extension MovieListDetailPage {
  struct MovieDirectorComponent {
    let viewState: ViewState
    let tapAction: () -> Void
  }
}

extension MovieListDetailPage.MovieDirectorComponent: View {
  var body: some View {
    Button(action: tapAction) {
      HStack {
        Text("Director: ")
          .font(.system(size: 16, weight: .bold))
          .foregroundColor(Color(.label))
        Text("test")
          .font(.system(size: 14, weight: .medium))
          .foregroundColor(AppColor.Label.base2)
        
        Spacer()
      }
    }
  }
}

extension MovieListDetailPage.MovieDirectorComponent {
  struct ViewState: Equatable {
  }
}


