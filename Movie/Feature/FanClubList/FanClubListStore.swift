import Foundation
import UIKit

final class FanClubListStore: ObservableObject, Store {
  
  @Published var state: State
  let effector: FanClubListEffector
  
  init(
    initialState state: State,
    effector: FanClubListEffector)
  {
    self.state = state
    self.effector = effector
  }
  
  var reduce: (State, Action, FanClubListEffector) async -> State {
    { state, action, effector in
      
      var newState = state
      
      switch action {
      case .loadProfileList:
        newState.itemList = await effector.itemList()
        return newState
        
      case .onTapProfile:
        await effector.routeToProfile()
        return newState
      }
    }
  }
}

extension FanClubListStore {
  // 타이틀, 사람이름, 풀네임 => 누르면 그 사람에 대한 Detail페이지
  struct State: Equatable {
    var itemList: [State.ScopeItem] = []
  }
  
  enum Action: Equatable {
    case loadProfileList
    case onTapProfile
  }
}

extension FanClubListStore.State {
  struct ScopeItem: Equatable {
    let profileImageURL: UIImage?
    let name: String
    let work: String
  }
}
