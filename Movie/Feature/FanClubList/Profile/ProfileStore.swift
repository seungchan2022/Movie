import Foundation
import UIKit

final class ProfileStore: ObservableObject, Store {
  
  @Published var state: State
  let effector: ProfileEffector
  
  init(
    initialState state: State,
    effector: ProfileEffector)
  {
    self.state = state
    self.effector = effector
  }
  
  var reduce: (State, Action, ProfileEffector) async -> State {
    { state, action, effector in
      
      var newState = state
      
      switch action {
        
      case .loadItemList:
        newState.itemList = await effector.itemList()
//                effector.getItemList { [weak self] itemList in
        //          self?.state.itemList = itemList
        return newState
        
      case .onShowMovieDetail:
        await effector.routeToMovieDetail()
        return newState
      }
    }
  }
}

extension ProfileStore {
  struct State: Equatable {
    var itemList: [State.ScopeItem] = []
  }
  
  enum Action: Equatable {
    case loadItemList
    case onShowMovieDetail
  }
}

extension ProfileStore.State {
  struct ScopeItem: Equatable {
    let name: String
    let image: UIImage?
//    let work: [String]
//    let biography: String
//    let birth: String
    let title: String
//    let workImageList
  }
}
