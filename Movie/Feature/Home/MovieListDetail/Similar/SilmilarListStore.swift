import Foundation
import UIKit
import Platform

final class SimilarListStore: ObservableObject, Store {
  
  @Published var state: State
  let effector: SimilarListEffector
  
  init(
    initialState state: State,
    effector: SimilarListEffector)
  {
    self.state = state
    self.effector = effector
  }
  
  var reduce: (State, Action, SimilarListEffector) async -> State {
    { state, action, effector in
      var newState = state
      
      switch action {
        
      case .onSelectedDetailItem(let selectedItemId):
        await effector.routeToMovieDetailPage(selectedItemId)

//      case .onSelectedDetailItem:
//        await effector.routeToMovieDetailPage(newState.movieItemID)
//        print("DEBUG: \(newState.movieItemID)")
        return newState
        
      case .onChangeLoading(let isLoading):
        newState.isLoading = isLoading
        return newState
        
      case .loadItemList:
        newState.isLoading = true
        Task {
          await self.send(effector.itemList(state.movieItemID))
        }
        return newState
        
      case .fetchItemList(let result):
        newState.fetchItemList.isLoading = false
        
        switch result {
        case .success(let item):
          newState.fetchItemList.value = item
          return newState
          
        case .failure(let error):
          Task {
            await self.send(.throwError(error))
          }
          return newState
        }
          
      case .throwError(let error):
        print(error.errorDescription ?? "")
        return newState
      }
    }
  }
}

extension SimilarListStore {
  struct State: Equatable {
    let movieItemID: String
    var currentPage: Int = .zero
    var isLoading: Bool = false
    var fetchItemList: FetchData<MovieAPIModel.Detail.Similar.Response?> = .init(value: .none)
    
    var selectedItemID: Int?
  }
  
  enum Action: Equatable {
    case onSelectedDetailItem(Int)
//    case onSelectedDetailItem(String)
    case loadItemList

    case fetchItemList(Result<MovieAPIModel.Detail.Similar.Response, CompositeError>)
    
    
    case onChangeLoading(Bool)
    case throwError(CompositeError)
  }
}

