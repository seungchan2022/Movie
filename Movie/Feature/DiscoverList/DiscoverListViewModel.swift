import Foundation
import UIKit

final class DiscoverListViewModel: ObservableObject {
 
  @Published var state: State
  private let effector: DiscoverListEffector
  
  init(
    initialState: State,
    effector: DiscoverListEffector)
  {
    self.state = initialState
    self.effector = effector
  }
  
  func send(action: ViewAction) {
    switch action {
    case .onTapItemListClear:
      state.itemList = ""
      return
      
    case .onTapItemListReset:
      state.itemList = state.tempList
      return
      
    case .onChangeSheet(let isShow):
      print("DEBUG ", isShow)
      state.isShowSheet = isShow
      return
    }
  }
}

extension DiscoverListViewModel {
  struct State: Equatable {
    var itemList: String
    var isShowSheet: Bool
    let tempList: String
    
    init(
      itemList: String,
      isShowSheet: Bool = false,
      tempList: String)
    {
      self.itemList = itemList
      self.isShowSheet = isShowSheet
      self.tempList = tempList
    }
  }
  
  enum ViewAction: Equatable {
    case onTapItemListClear
    case onTapItemListReset
    case onChangeSheet(Bool)
  }
}
