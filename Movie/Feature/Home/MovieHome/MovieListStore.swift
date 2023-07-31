import Foundation
import UIKit

final class MovieListStore: ObservableObject, Store {

  @Published var state: State
  let effector: MovieListEffector
  
  init(
    initialState state: State,
    effector: MovieListEffector)
  {
    self.state = state
    self.effector = effector
  }
  
  var reduce: (State, Action, MovieListEffector) async -> State {
    { state, action, effector in
      var newState = state
      
      switch action {
      case .onChangeKeyword(let keyword):
        newState.keyword = keyword
        return newState

      case .onSelectedDetailItem(let item):
        await effector.routeToMovieDetailPage(item)
        newState.selectedItemID = item.id
        return newState
        
      case .onChangeLoading(let isLoading):
        newState.isLoading = isLoading
        return newState
        
      case .loadItemList:
        Task {
//          print("loadItemList BBB")
          await self.send(effector.itemList(state.currentPage + 1))
        }
        
//        print("loadItemList AAA")
        newState.isLoading = true
        return newState
        
      case .fetchItemList(let itemList):
//        print("fetchItemList CCC")
        newState.itemList = newState.itemList + itemList
        newState.currentPage = state.currentPage + 1
        newState.isLoading = false
        return newState
        
      case .onChangeSheet(let isShow):
//        print("DEBUG: ", isShow)
        newState.isShowSheet = isShow
        return newState
      }
    }
  }
}

extension MovieListStore {
  struct State: Equatable {
    var keyword = ""
    var itemList: [State.ScopeItem] = []
    var isShowSheet: Bool
    var currentPage: Int = .zero
    var isLoading: Bool = false // loading indicator 만들기 위한 작업
    
    var selectedItemID: Int? // 옵셔널로 선언하여 선택된 항목이 없을 때 nil로 설정
    init(isShowSheet: Bool = false) {
      self.isShowSheet = isShowSheet
    }
  }

  enum Action: Equatable {
    case onChangeKeyword(String)
    case onSelectedDetailItem(MovieListStore.State.ScopeItem)
    case loadItemList
    case fetchItemList([State.ScopeItem])
    case onChangeSheet(Bool)
    case onChangeLoading(Bool)
  }
}

extension MovieListStore.State {
  struct ScopeItem: Equatable, Identifiable {
    let id: Int
    let imageURL: String
    let title: String
    let date: String
    let rate: Double
    let summary: String
  }
}

