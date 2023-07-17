import Foundation
import SwiftUI

struct DirectorPage {
  @ObservedObject var viewStore: DirectorStore
  
}

extension DirectorPage {
  var state: DirectorStore.State {
    viewStore.state
  }
}

extension DirectorPage: View {
  var body: some View {
    VStack {
      if let selecedItem = state.itemList.first(where: { $0.movieItemId == state.movieItemID}) {
        Text(selecedItem.name)
      }
    }
    .onAppear {
      viewStore.send(.loadItemList)
    }
  }
}


