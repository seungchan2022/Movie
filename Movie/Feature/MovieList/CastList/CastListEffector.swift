
import Foundation
import UIKit

struct CastListEffector {
  let navigator: NavigatorType
  let diContainer: DIContainerType
}

extension CastListEffector {
  // 프로필 디테일 페이지
  
  // 프로필 데이터
  func getProfileList(callback: @escaping ([CastListViewModel.State.ScopeItem]) -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
      callback([
        .init(
          profileImage: UIImage(named: "jason"),
          name: "Jason Statham",
          character: "Shaw"),
        .init(
          profileImage: UIImage(named: "charlize"),
          name: "Charlize Theron",
          character: "Cipher"),
        .init(
          profileImage: UIImage(named: "tyrese"),
          name: "Tyrese Gibson",
          character: "Roman"),
        .init(
          profileImage: UIImage(named: "ludacris"),
          name: "Ludacris",
          character: "Tej"),
      ])
    }
  }
}
