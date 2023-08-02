import Foundation
import UIKit

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
      case .loadItemList:
        Task {
          await self.send(effector.itemList(state.movieItemID))
        }
//        newState.itemList = await effector.itemList()
        return newState
        
      case . fetchItemList(let itemList):
        newState.itemList = itemList
        return newState
      }
    }
  }
}

extension CastListStore {
  struct State: Equatable {
    let movieItemID: String
    var itemList: [State.ScopeItem] = []
    
  }
  
  enum Action: Equatable {
    case loadItemList
    case fetchItemList([State.ScopeItem])
  }
}

extension CastListStore.State {
  struct ScopeItem: Equatable, Identifiable {
    let id: Int  // movieid
    let cast: [String]  // 이안에 cast에 대한 데이터
//    let movieItemId: String 
//    let profileImage: UIImage?
//    let name: String
//    let character: String
  }
}

// 디테일 페이지에서 다른 곳을 갈때는 item.id로 하고 그 안에 페이지에서 다른 곳으로 갈때는 다른 것으로 key를 정하면서 들어 갈수 있나?
// cast의 movieItemID를 만들어서 id를 각 프로필의 id로 정하고 movieItemID를 전에 계속 들어오는 각 영화 데이터를 받아오는 느낌으로 하려하는데 movie -> MovieDetail로 들어갈때 Link의 item을 "movieItemID" = item.id로 해서 계속 그렇게 받아 들어가져야 되나..?
// 내가 DetailPage에서도 다른 곳으로 Link를 통해서 이동할때 이전과 같이 설정한것 때문인가..?
