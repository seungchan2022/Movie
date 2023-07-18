import Foundation
import UIKit

final class DiscoverListStore: ObservableObject, Store {
 
  @Published var state: State
  let effector: DiscoverListEffector
  
  init(
    initialState state: State,
    effector: DiscoverListEffector)
  {
    self.state = state
    self.effector = effector
  }
  
  var reduce: (State, Action, DiscoverListEffector) async -> State {
    { state, action, effector in
      var newState = state
      
      switch action {
      case .onTapItemListClear:
        newState.itemList = ""
        return newState
        
      case .onTapItemListReset:
        newState.itemList = newState.tempList
        return newState
        
      case .onChangeSheet(let isShow):
        print("DEBUG ", isShow)
        newState.isShowSheet = isShow
        return newState
      }
      
    }
  }
}

extension DiscoverListStore {
  struct State: Equatable {
    var itemList: String
    var isShowSheet: Bool
    let tempList: String
    
    init(
      itemList: String,
      isShowSheet: Bool = false,
      tempList: String)
    {
      self.itemList = itemList
      self.isShowSheet = isShowSheet
      self.tempList = tempList
    }
  }
  
  enum Action: Equatable {
    case onTapItemListClear
    case onTapItemListReset
    case onChangeSheet(Bool)
  }
}
