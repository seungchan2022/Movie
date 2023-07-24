import Foundation
import UIKit

final class MyListsListStore: ObservableObject, Store {
  
  @Published var state: State
  let effector: MyListsListEffector
  
  init(
    initialState state: State,
    effector: MyListsListEffector)
  {
    self.state = state
    self.effector = effector
  }
  
  var reduce: (State, Action, MyListsListEffector) async -> State {
    { state, action, effector in
      var newState = state
      
      switch action {
      case .loadItemList:
        newState.itemList = await effector.itemList()
        return newState
        
      case .onChangeSheet(let isShow):
        print("DEBUG: ", isShow)
        newState.isShowSheet = isShow
        return newState
        
      case .loadWishItemList:
        newState.wishItemList = await effector.wishItemList()
        newState.showType = .wishList
        return newState
        
      case .loadSeenItemList:
        newState.seenItemList = await effector.seenItemList()
        newState.showType = .seenList
        return newState
        
      case .onChangeShowType(let type):
        print("type", type)
        newState.showType = type
//        newState.lastSelectedListType = type
        return newState
        
      case .onSelectDetailItem(let item):
        await effector.routeToMovieDetailPage(item)
        return newState
      }
    }
  }
}

extension MyListsListStore {
  struct State: Equatable {
    var itemList: [State.ScopeItem] = []
    var wishItemList: [State.ScopeItem] = []
    var seenItemList: [State.ScopeItem] = []
    var isShowSheet: Bool
    var showType: ShowType = .wishList
//    var lastSelectedListType: ShowType?

    init(isShowSheet: Bool = false) {
      self.isShowSheet = isShowSheet
    }
  }
  
  enum Action: Equatable {
    // 디테일 페이지 액션도 구현
    // 아이템
    case loadItemList
    case loadWishItemList
    case loadSeenItemList
    case onChangeSheet(Bool)
    case onChangeShowType(MyListsListStore.State.ShowType)
    case onSelectDetailItem(MyListsListStore.State.ScopeItem)
  }
}

extension MyListsListStore.State {
  struct ScopeItem: Equatable, Identifiable {
    let id: String
    let imageURL: UIImage?
    let title: String
    let date: String
    let rate: Double
    let summary: String
  }
  
  enum ShowType: Equatable {
    case wishList
    case seenList
  }
}
