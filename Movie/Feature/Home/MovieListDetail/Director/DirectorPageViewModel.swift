import Foundation
import UIKit

final class DirectorStore: ObservableObject, Store {
  
  @Published var state: State
  private let effector: DirectorPageEffector
  
  init(
    initialState state: State,
    effector: DirectorPageEffector)
  {
    self.state = state
    self.effector = effector
  }
  
  var reduce: (State, Action, Effector) async -> State {
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

extension DirectorPage {
  struct State: Equatable {
    let movieItemID: String
    var itemList: [State.ScopeItem] = []
  }
  
  enum Action: Equatable {
    case loadItemList
  }
}

extension DirectorPage.State {
  struct ScopeItem: Equatable, Identifiable {
    let id: String
    let movieItemId: String
    let name: String
  }
}
