import Foundation
import SwiftUI

struct ReviewsPage {
  @ObservedObject var viewStore: ReviewsStore
  
}

extension ReviewsPage {
  var state: ReviewsStore.State {
    viewStore.state
  }
}

extension ReviewsPage: View {
  var body: some View {
    VStack {
      if let selecedItem = state.itemList.first(where: { $0.id == state.movieItemID}) {
        Text(selecedItem.reviews)
      }
    }
    .onAppear {
      viewStore.send(.loadItemList)
    }
  }
}


