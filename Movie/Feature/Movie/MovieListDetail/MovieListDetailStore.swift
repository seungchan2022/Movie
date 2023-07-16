import Foundation
import UIKit

final class MovieListDetailStore: ObservableObject, Store {
  
  @Published var state: State
  let effector: MovieListDetailEffector
  
  init(
    initialState state: State,
    effector: MovieListDetailEffector)
  {
    self.state = state
    self.effector = effector
  }
  
  var reduce: (State, Action, MovieListDetailEffector) async -> State {
    { state, action, effector in
      var newState = state
      
      switch action {
      case .onTapReviews:
        effector.routeToReviews()
        return newState
        
      case .onTapCastList:
        effector.routeToCastList()
        return newState
        
      case .onTapDirector:
        effector.routeToDirector()
        return newState
        
      case .loadItemList:
        newState.itemList = await effector.itemList()
        return newState
      }
    }
  }
}

extension MovieListDetailStore {
  struct State: Equatable {
    let movieItemID: String
    var itemList: [State.ScopeItem] = []
  }
  
  enum Action: Equatable {
    case onTapReviews
    case onTapCastList
    case onTapDirector
    case loadItemList
  }
}

extension MovieListDetailStore.State {
  struct ScopeItem: Equatable, Identifiable {
    let id: String
    let title: String
    let imageURL: UIImage?
    let year: Int
    let runningTime: Int
    let release: String
    let rate: Double
    let comments: Int
  }
}

