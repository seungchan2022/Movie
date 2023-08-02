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
        
      case .onChangeLoading(let isLoading):
        newState.isLoading = isLoading
        return newState
                
      case .loadItemList:
        //        newState.itemList = await effector.itemList()
        Task {
          print("loadItemList bbb")
          await self.send(effector.itemList(state.movieItemID))
          //          await self.send(.fetchItemList(state.itemList))
        }
        print("loadItemList aaa")
        newState.isLoading = true
        return newState
        
      case .fetchItemList(let itemList):
        print("fetchImteList ccc")
        //        newState.itemList = newState.itemList + itemList
        newState.itemList = itemList
        newState.isLoading = false
        return newState
      }
    }
  }
}

extension MovieListDetailStore {
  struct State: Equatable {
    let movieItemID: String
    var itemList: [State.ScopeItem] = []
    var isLoading: Bool = false
    var selectedItemID: Int?
  }
  
  enum Action: Equatable {
    case onTapReviews(MovieListDetailStore.State.ScopeItem)
    case onTapCastList(MovieListDetailStore.State.ScopeItem)
    case onTapDirector(MovieListDetailStore.State.ScopeItem)
    case loadItemList
    case fetchItemList([State.ScopeItem])
    case onChangeLoading(Bool)
  }
}

extension MovieListDetailStore.State {
  struct ScopeItem: Equatable, Identifiable {
    let id: Int
    let title: String
    //    let imageURL: UIImage?
    let imageURL: String
    let releaseDate: String
    let runningTime: Int
    let status: String
    let country: [String]
    let voteAverage: Double
    let voteCount: Int
    let geners: [String]
    let reviews: String
    let overview: String
    let keywords: [String]
    //    let cast: [String]
    let director: String
  }
}

