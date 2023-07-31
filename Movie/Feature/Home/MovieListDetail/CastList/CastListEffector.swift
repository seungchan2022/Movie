
import Foundation
import UIKit

struct CastListEffector {
  let navigator: NavigatorType
  let diContainer: DIContainerType
}

extension CastListEffector {
  // 프로필 디테일 페이지
  
  // 프로필 데이터
  var itemList: () async ->
  [CastListStore.State.ScopeItem] {
    {
      let _ = try? await Task.sleep(for: .zero)
      
      return [
          .init(
            id: "jason",
            movieItemId: "fastx",
            profileImage: UIImage(named: "jason"),
            name: "Jason Statham",
            character: "Shaw"),
          .init(
            id: "charlize",
            movieItemId: "fastx",
            profileImage: UIImage(named: "charlize"),
            name: "Charlize Theron",
            character: "Cipher"),
          .init(
            id: "tyrese",
            movieItemId: "fastx",
            profileImage: UIImage(named: "tyrese"),
            name: "Tyrese Gibson",
            character: "Roman"),
          .init(
            id: "ludacris",
            movieItemId: "fastx",
            profileImage: UIImage(named: "ludacris"),
            name: "Ludacris",
            character: "Tej"),
            .init(
              id: "123",
              movieItemId: "transformer",
              profileImage: .none,
              name: "The cast of transformer",
              character: "onetwothree"),
          .init(
            id: "5153",
            movieItemId: "spiderman",
            profileImage: .none,
            name: "The cast of spiderman",
            character: "dgml,djglkdjsgkl"),
      ]
    }
  }
  
}
