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
      ForEach(state.itemList) { item in
        if item.movieItemId == state.movieItemID {
          VStack {
            Text(item.name)
            Text(item.id)
          }
        }
      }
    }
    .onAppear {
      viewStore.send(.loadItemList)
    }
  }
}

// $0.movieItemId는 CastListstotr.state.scopeItem이고, state.movieItemID는 처음 무비 화면에서 계속 클릭하면서 각 아이템을 구분하면서 계속 들어오는 movieItemID이다 !!!!
// => 어지럽고, 헷갈린다...
