import Foundation
import UIKit

final class ReviewsStore: ObservableObject, Store {

  @Published var state: State
  let effector: ReviewsEffector
  
  init(
    initialState state: State,
    effector: ReviewsEffector)
  {
    self.state = state
    self.effector = effector
  }
  
  var reduce: (State, Action, ReviewsEffector) async -> State {
    { state, action, effector in
      var newState = state
      
      switch action {
      case .loadItemList:
        newState.itemList = await effector.itemList()
        return newState
      }
    }
  }
}

extension ReviewsStore {
  struct State: Equatable {
    let movieItemID: String
    var itemList: [State.ScopeItem] = []
  }
  
  enum Action: Equatable {
    case loadItemList
  }
}

extension ReviewsStore.State {
  struct ScopeItem: Equatable, Identifiable {
    let id: String
    let reviews: String
  }
}
