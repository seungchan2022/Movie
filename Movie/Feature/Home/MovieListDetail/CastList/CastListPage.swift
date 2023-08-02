import Foundation
import SwiftUI

struct CastListPage {
  @ObservedObject var viewStore: CastListStore
}

extension CastListPage {
  var state: CastListStore.State {
    viewStore.state
  }
}

extension CastListPage: View {
  var body: some View {
    List {
      if let selectedItem = state.itemList.first(where: { "\($0.id)" == state.movieItemID }) {
        HStack {
//          Image(uiImage: selectedItem.profileImage ?? UIImage())
//            .resizable()
//            .aspectRatio(contentMode: .fill)
//            .frame(width: 60, height: 80)
//            .cornerRadius(10)
          VStack(alignment: .leading, spacing: 8) {
            Spacer()
            Text(selectedItem.cast[0])
              .font(.system(size: 16, weight: .bold))
            Text("\(selectedItem.id)")
              .font(.system(size: 14, weight: .medium))
              .foregroundColor(.gray)
            Spacer()
          }
        }
      }
    }
    
//    List {
//      ForEach(state.itemList) { item in
//        if item.movieItemId == state.movieItemID {
//          HStack {
//            Image(uiImage: item.profileImage ?? UIImage())
//              .resizable()
//              .aspectRatio(contentMode: .fill)
//              .frame(width: 60, height: 80)
//              .cornerRadius(10)
//            VStack(alignment: .leading, spacing: 8) {
//              Spacer()
//              Text(item.name)
//                .font(.system(size: 16, weight: .bold))
//              Text(item.id)
//                .font(.system(size: 14, weight: .medium))
//                .foregroundColor(.gray)
//              Spacer()
//            }
//          }
//        }
//      }
//    }
    .onAppear {
      viewStore.send(.loadItemList)
    }
  }
}

// movieItemId는 CastListstotr.state.scopeItem이고, state.movieItemID는 처음 무비 화면에서 계속 클릭하면서 각 아이템을 구분하면서 계속 들어오는 movieItemID이다 !!!!
// => 어지럽고, 헷갈린다...
