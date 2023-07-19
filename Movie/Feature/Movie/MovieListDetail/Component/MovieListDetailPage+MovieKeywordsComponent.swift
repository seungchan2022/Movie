import Foundation
import SwiftUI
import DesignSystem

extension MovieListDetailPage {
  struct MovieKeywordsComponent {
    let viewState: ViewState
    // 나중에 눌렀을때 해당 키워드로 이동하도록
//    let tapAction: (MovieListDetailStore.State.ScopeItem) -> Void
  }
}

extension MovieListDetailPage.MovieKeywordsComponent: View {
  var body: some View {
    VStack(alignment: .leading, spacing: .zero) {
      Spacer()
      Text("keywords")
        .font(.system(size: 16, weight: .bold))
      ScrollView(.horizontal, showsIndicators: false) {
        LazyHStack(spacing: 12) {
          ForEach(0..<viewState.item.keywords.count) { index in
            Button(action: {
              print(viewState.item.keywords[index])
            }) {
              Text(viewState.item.keywords[index])
                .font(.system(size: 14, weight: .bold))
              Image(systemName: "chevron.right")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 10, height: 10)
              
            }
          }
          .foregroundColor(Color(.label))
          .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4))
          .background(RoundedRectangle(cornerRadius: 10).fill(AppColor.Background.base))
          Spacer()
        } // LazyHStack (keyword)
        
      }
    }
  }
}

extension MovieListDetailPage.MovieKeywordsComponent {
  struct ViewState: Equatable {
    let item: MovieListDetailStore.State.ScopeItem
  }
}
