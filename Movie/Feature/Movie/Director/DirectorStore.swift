import Foundation
import UIKit

final class DirectorStore: ObservableObject, Store {
  
  
  @Published var state: State
  let effector: DirectorEffector
  
  init(
    initialState state: State,
    effector: DirectorEffector)
  {
    self.state = state
    self.effector = effector
  }
  
  var reduce: (State, Action, DirectorEffector) async -> State {
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

extension DirectorStore {
  struct State: Equatable {
    let movieItemID: String
    var itemList: [State.ScopeItem] = []
  }
  
  enum Action: Equatable {
    case loadItemList
  }
}

extension DirectorStore.State {
  struct ScopeItem: Equatable, Identifiable {
    let id: String
    let movieItemId: String
    let name: String
  }
}
