import Foundation
import UIKit

final class MyListsListViewModel: ObservableObject {
  
  @Published var state: State
  private let effector: MyListsListEffector
  
  init(
    initialState: State,
    effector: MyListsListEffector)
  {
    self.state = initialState
    self.effector = effector
  }
  
  func send(action: ViewAction) {
    switch action {
    case .loadItemList:
      effector.getItemList { [weak self] itemList in
        self?.state.itemList = itemList
      }
      return
      
    case .onChangeSheet(let isShow):
      print("DEBUG: ", isShow)
      state.isShowSheet = isShow
      return
      
    case .onMovieDetail:
      effector.routeToMovieDetail()
      return
      
    }
  }
}

extension MyListsListViewModel {
  struct State: Equatable {
    var itemList: [State.ScopeItem] = []
    var isShowSheet: Bool
    
    init(isShowSheet: Bool = false) {
      self.isShowSheet = isShowSheet
    }
  }
  
  enum ViewAction: Equatable {
    // 디테일 페이지 액션도 구현
    // 아이템
    case loadItemList
    case onChangeSheet(Bool)
    case onMovieDetail
  }
}

extension MyListsListViewModel.State {
  struct ScopeItem: Equatable {
    let imageURL: UIImage?
    let title: String
    let date: String
    let rate: Double
    let summary: String
  }
}
