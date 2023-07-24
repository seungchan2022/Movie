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
      case .onTapReviews(let item):
        await effector.routeToReviews(item)
        return newState
                
      case .onTapCastList(let item):
        await effector.routeToCastList(item)
        return newState
        
      case .onTapDirector(let item):
        await effector.routeToDirector(item)
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
    case onTapReviews(MovieListDetailStore.State.ScopeItem)

    case onTapCastList(MovieListDetailStore.State.ScopeItem)
    case onTapDirector(MovieListDetailStore.State.ScopeItem)
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
    let geners: [String]
    let reviews: String
    let overview: String
    let keywords: [String]
    //    let cast: [String]
    let director: String
  }
}

