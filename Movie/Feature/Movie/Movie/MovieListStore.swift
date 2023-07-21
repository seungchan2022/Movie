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
        effector.routeToMovieDetailPage(item)
        return newState
        
      case .loadItemList:
        newState.itemList = await effector.itemList()
        return newState
        
      case .onChangeSheet(let isShow):
        print("DEBUG: ", isShow)
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
    
    init(isShowSheet: Bool = false) {
      self.isShowSheet = isShowSheet
    }
    
  }

  enum Action: Equatable {
    case onChangeKeyword(String)
    case onSelectedDetailItem(MovieListStore.State.ScopeItem)
    case loadItemList
    case onChangeSheet(Bool)
  }
}

extension MovieListStore.State {
  struct ScopeItem: Equatable, Identifiable {
    let id: String
    let imageURL: UIImage?
    let title: String
    let date: String
    let rate: Double
    let summary: String
  }
}

