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
      if let selecedItem = state.itemList.first(where: { "\($0.id)" == state.movieItemID}) {
        //        Text("\(selecedItem.id)")
//        Text(selecedItem.author)
//        Text(selecedItem.content)
        Text("\(selecedItem.id)")
        Text("\(selecedItem.page)")
        
        //        ForEach(0..<selecedItem.reviews.count) { index in
        //          Text(selecedItem.reviews[index])
        //        }
      }
    }
    //    Text("Review Page")
    .setLoading(state.isLoading)
    .onAppear {
         viewStore.send(.loadItemList)
    }    
  }
}


