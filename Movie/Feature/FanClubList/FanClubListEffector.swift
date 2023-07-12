import Foundation
import UIKit

struct FanClubListEffector {
  let navigator: NavigatorType
  let diContainer: DIContainerType
}

extension FanClubListEffector {
  // 프로필 디테일 페이지
  
  // 프로필 데이터
  func getProfileList(callback: @escaping ([FanClubListViewModel.State.ScopeItem]) -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
      callback([
        .init(
          profileImageURL: .none,
          name: "Alan Arkin",
          work: "Edward Scissorhands"),
      ])
    }
  }
}
