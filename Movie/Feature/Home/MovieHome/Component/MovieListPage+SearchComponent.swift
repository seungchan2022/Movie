import Foundation
import SwiftUI
import DesignSystem

extension MovieListPage {
  struct SearchComponent {
    @FocusState private var isFocused
    let viewState: ViewState
    let textChangeAction: (String) -> Void
  }
}

extension MovieListPage.SearchComponent {
  private var textBinding: Binding<String> {
    .init(
      get: { viewState.text },
      set: { textChangeAction($0) })
  }
}

extension MovieListPage.SearchComponent: View {
  var body: some View {
    HStack(spacing: 15) {
      Image(systemName: "magnifyingglass")
        .renderingMode(.template)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 20, height: 20)
      
      TextField("Search any movie or person", text: textBinding)
        .textFieldStyle(.plain)
        .frame(height: 40)
        .padding(.horizontal)
        .background(
          RoundedRectangle(cornerRadius: 5)
            .stroke(.gray.opacity(0.2), lineWidth: 1))
        .focused($isFocused, equals: true)
      
      if !viewState.text.isEmpty {
        Button(action: { textBinding.wrappedValue = "" }) {
          Text("Cancel")
            .foregroundColor(AppColor.Tint.primary)
        }
      }
    }
  }
}

extension MovieListPage.SearchComponent {
  struct ViewState: Equatable {
    let text: String
  }
}
