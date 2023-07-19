import Foundation
import SwiftUI
import DesignSystem

extension MovieListDetailPage {
  struct MovieCardComponent {
    let viewState: ViewState
//    let tapAction: (MovieListDetailStore.State.ScopeItem) -> Void
  }
}

extension MovieListDetailPage.MovieCardComponent: View {
  var body: some View {
    VStack {
      HStack {
        Image(uiImage: viewState.item.imageURL ?? UIImage())
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: 120, height: 160)
          .clipShape(RoundedRectangle(cornerRadius: 10))
        
        VStack(alignment: .leading) {
          Spacer()
          
          Group {
            Text("\(viewState.item.year) • ") +
            Text("\(viewState.item.runningTime) minutes • ") +
            Text(viewState.item.release)
          }
          
          Spacer()
          
          HStack(spacing: 5) {
            Image(systemName: "star.fill")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 16, height: 16)
              .foregroundColor(AppColor.Tint.primary)
            Text(String(format: "%.1f", viewState.item.rate))
            Text("\(viewState.item.comments) ratings")
            
            Spacer()
          }
          Spacer()
        }
        .font(.system(size: 16, weight: .medium))
        .foregroundColor(.white)
        
        
      }
      HStack {  // 각 영화에 맞는 장르들이 나오도록
        ForEach(0..<viewState.item.geners.count) { index in
          Button(action: { print(viewState.item.geners[index]) }) {
            Text(viewState.item.geners[index])
              .font(.system(size: 14, weight: .bold))
            Image(systemName: "chevron.right")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 10, height: 10)
          }
        } // Forech
        .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 4))
        .background(
          RoundedRectangle(cornerRadius: 16).fill(AppColor.Background.base)
        )
        Spacer()
      } // hstack
      .buttonStyle(.plain)
      .foregroundColor(Color(.label))
      .padding(.top, 12)
      .padding(.bottom, 12)
    }
    .padding(.top, 8)
  }
}

extension MovieListDetailPage.MovieCardComponent {
  struct ViewState: Equatable {
    let item: MovieListDetailStore.State.ScopeItem
  }
}
