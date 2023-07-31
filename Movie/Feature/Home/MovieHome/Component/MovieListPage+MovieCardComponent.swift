import Foundation
import SwiftUI
import DesignSystem

extension MovieListPage {
  struct MovieCardComponent {
    let viewState: ViewState
    let tapAction: (MovieListStore.State.ScopeItem) -> Void
  }
}

extension MovieListPage.MovieCardComponent: View {
  var body: some View {
    HStack(spacing: 16) {
      RemoteImage(url: viewState.item.imageURL)
//      AsyncImage(
//        url: URL(string: viewState.item.imageURL),
//        content: { $0.resizable()
//        }, placeholder: {
//          Rectangle()
//            .fill(Color.gray)
//        })
        .frame(width: 100, height: 160)
        .clipShape(RoundedRectangle(cornerRadius: 10))
      
      VStack(alignment: .leading, spacing: 16) {
        Spacer()
        Text(viewState.item.title)
          .font(.system(size: 18, weight: .medium))
          .foregroundColor(AppColor.Label.base)
        
        HStack(spacing: 5) {
          Image(systemName: "star.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 16, height: 16)
            .foregroundColor(AppColor.Tint.primary)
          
          Text(String(format: "%.1f", viewState.item.rate))
          
          Text(viewState.item.date)
        }
        .font(.system(size: 16, weight: .medium))
        
        Text(viewState.item.summary)
          .font(.system(size: 16, weight: .medium))
          .foregroundColor(AppColor.Label.base2)
        
        Spacer()
      }
      
      Spacer()
    }
    .frame(height: 200)
    .onTapGesture {
      tapAction(viewState.item)
    }
  }
}

extension MovieListPage.MovieCardComponent {
  struct ViewState: Equatable {
    let item: MovieListStore.State.ScopeItem
  }
}
