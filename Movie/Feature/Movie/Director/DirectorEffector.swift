import Foundation
import UIKit

struct DirectorEffector {
  let navigator: NavigatorType
  let diContainer: DIContainerType
}

extension DirectorEffector {
  
  var itemList: () async -> [DirectorStore.State.ScopeItem] {
    {
      let _ = try? await Task.sleep(for: .zero)
      
      return [
        .init(
          id: "The director ID of the fastx",
          movieItemId: "fastx",
          name: "The director information of fastx"),
        .init(
          id: "The director ID of the transformer",
          movieItemId: "transformer",
          name: "The director information of transformer"),
        .init(
          id: "The director ID of the spiderman",
          movieItemId: "spiderman",
          name: "The director information of spidemran"),
      ]
    }
  }
}
