import Foundation

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
          id: "영화 감독 이름",
          movieItemId: "fastx",
          name: "영화 감독 이름"),
        .init(
          id: "영화 감독 이름1",
          movieItemId: "transformer",
          name: "영화 감독 이름1"),
        .init(
          id: "영화 감독 이름3",
          movieItemId: "spiderman",
          name: "영화 감독 이름3"),
      ]
    }
  }
}
