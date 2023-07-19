import Foundation
import SwiftUI
import DesignSystem

extension MyListsListPage {
  struct WishListComponent {
    let viewState: ViewState
//    let tapAction: (MyListsListStore.State.ScopeItem) -> Void
  }
}

extension MyListsListPage.WishListComponent: View {
  var body: some View {
    HStack {
      Image(uiImage: viewState.item.imageURL ?? UIImage())
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: 100, height: 160)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.bottom, 8)
      
      VStack(alignment: .leading, spacing: 16) {
        Text(viewState.item.title)
          .font(.system(size: 18, weight: .medium))
          .foregroundColor(AppColor.Label.base)
        
        HStack {
          Image(systemName: "star.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 16, height: 16)
            .foregroundColor(AppColor.Tint.primary)
          
          Text(String(format: "%.1f", viewState.item.rate))
          
          Text(viewState.item.date)
        }
        .font(.system(size: 16, weight: .medium))
        .foregroundColor(AppColor.Label.base2)
        .lineLimit(1)
        .minimumScaleFactor(0.5)
        
        
        Text(viewState.item.summary)
          .font(.system(size: 16, weight: .medium))
          .foregroundColor(AppColor.Label.base2)
          .lineLimit(3)
      }
      Spacer()
    }
  }
}

extension MyListsListPage.WishListComponent {
  struct ViewState: Equatable {
    let item: MyListsListStore.State.ScopeItem
  }
}
