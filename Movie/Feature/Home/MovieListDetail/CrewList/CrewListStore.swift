import Foundation
import UIKit
import Platform

final class CrewListStore: ObservableObject, Store {
  
  @Published var state: State
  let effector: CrewListEffector
  
  init(
    initialState state: State,
    effector: CrewListEffector)
  {
    self.state = state
    self.effector = effector
  }
  
  var reduce: (State, Action, CrewListEffector) async -> State {
    { state, action, effector in
      var newState = state
      
      switch action {
      case .onChangeLoading(let isLoading):
        newState.isLoading = isLoading
        return newState
        
      case .loadItem:
        newState.isLoading = true
        Task {
          await self.send(effector.crew(state.movieItemID))
        }
        return newState
        
      case .fetchCrew(let result):
        newState.fetchCrewData.isLoading = false
        
        switch result {
        case .success(let item):
          newState.fetchCrewData.value = item
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

extension CrewListStore {
  struct State: Equatable {
    let movieItemID: String
    var isLoading: Bool = false
    
    var fetchCrewData: FetchData<MovieAPIModel.Detail.Credit.Response?> = .init(value: .none)
  }
  
  enum Action: Equatable {
    case loadItem
    
    case fetchCrew(Result<MovieAPIModel.Detail.Credit.Response, CompositeError>)
    
    case onChangeLoading(Bool)
    case throwError(CompositeError)
  }
}

//extension CrewListStore.State {
//  struct ScopeItem: Equatable, Identifiable {
//    let id: Int  // crew id
////    let movieID: Int  // 넘겨지는 movie id
//    let name: String  // 크루 이름
//    let department: String // 부서
//    let profileImage: String
//  }
//}
//

