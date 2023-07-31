import Foundation
import UIKit

struct ReviewsEffector {
  let navigator: NavigatorType
  let diContainer: DIContainerType
}

extension ReviewsEffector {
  var itemList: () async -> [ReviewsStore.State.ScopeItem] {
    {
      let _ = try? await Task.sleep(for: .zero)
      
      return [
        .init(
          id: "fastx",
          reviews: "Reviews of fast x"),
        .init(
          id: "transformer",
          reviews: "Reviews of transformer"),
        .init(
          id: "spiderman",
          reviews: "Reviews of spiderman"),
      ]
    }
  }
}
