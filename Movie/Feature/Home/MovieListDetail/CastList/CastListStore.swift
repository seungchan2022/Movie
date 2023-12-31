import Foundation
import UIKit
import Platform

final class CastListStore: ObservableObject, Store {
  
  @Published var state: State
  let effector: CastListEffector
  
  init(
    initialState state: State,
    effector: CastListEffector)
  {
    self.state = state
    self.effector = effector
  }
  
  var reduce: (State, Action, CastListEffector) async -> State {
    { state, action, effector in
      var newState = state
      
      switch action {
      case .onChangeLoading(let isLoading):
        newState.isLoading = isLoading
        return newState
        
      case .loadItem:
        newState.isLoading = true
        Task {
          print("load cast list page bbb")
          await self.send(effector.cast(state.movieItemID))
        }
        print("load cast list page aaa")
        return newState
        
      case .fetchCast(let result):
        print("fetch cast list page ccc")
        newState.fetchCastData.isLoading = false
        
        switch result {
        case .success(let item):
          newState.fetchCastData.value = item
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

extension CastListStore {
  struct State: Equatable {
    let movieItemID: String
    var isLoading: Bool = false
    
    var fetchCastData: FetchData<MovieAPIModel.Detail.Credit.Response?> = .init(value: .none)
  }
  
  enum Action: Equatable {
    case loadItem
    
    case fetchCast(Result<MovieAPIModel.Detail.Credit.Response, CompositeError>)
    
    case onChangeLoading(Bool)
    case throwError(CompositeError)
  }
}

//extension CastListStore.State {
//  struct ScopeItem: Equatable, Identifiable {
//    let id: Int  // cast id
////    let movieID: Int  // 넘겨지는 movie id
//    let name: String  // 배우 이름
//    let character: String // 배역 이름
//    let profileImage: String
//  }
//}

