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
        
      case .onChangeLoading(let isLoading):
        newState.isLoading = isLoading
        return newState
        
      case .loadItemList:
//        newState.itemList = await effector.itemList()
        Task {
          print("load review bbb")
          await self.send(effector.itemList(state.movieItemID))
        }
        print("load review aaa")
        newState.isLoading = true
        return newState

      case .fetchItemList(let itemList):
        print("fetch reviw ccc")
        newState.itemList = itemList
//        newState.itemList = newState.itemList + itemList
//        newState.currentPage = state.currentPage + 1
        newState.isLoading = false
        return newState
      }
    }
  }
}

extension ReviewsStore {
  struct State: Equatable {
    let movieItemID: String // movieid
    var itemList: [State.ScopeItem] = []
    var isLoading: Bool = false
//    var currentPage: Int = .zero
  }
  
  enum Action: Equatable {
    case loadItemList
    case fetchItemList([State.ScopeItem])
    case onChangeLoading(Bool)
  }
}

// 우리가 화면에 불러올 데이터
extension ReviewsStore.State {
  struct ScopeItem: Equatable, Identifiable {
//    let id: String  // review id
//    let author: String
//    let content: String
    let id: Int // review page의 무비 아이디
    let page: Int
  }
}
