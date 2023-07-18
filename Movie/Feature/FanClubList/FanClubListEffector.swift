import Foundation
import UIKit

struct FanClubListEffector {
  let navigator: NavigatorType
  let diContainer: DIContainerType
}

extension FanClubListEffector {
  // 프로필 디테일 페이지
  var routeToProfile: () -> Void {
    {
      navigator.push(
        featureName: Link.profile.rawValue,
        items: [:],
        isAnimation: true)
    }
  }
  
  // 프로필 데이터
  var itemList: () async -> [FanClubListStore.State.ScopeItem] {
    {
      let _ = try? await Task.sleep(for: .zero)
      
      return [
        .init(
          profileImageURL: UIImage(named: "alan"),
          name: "Alan Arkin",
          work: "Edward Scissorhands, Argo, Gattaca"),
        .init(
          profileImageURL: UIImage(named: "ana"),
          name: "Ana de Armas",
          work: "Blade Runner 2049, Knivees Out, War Dogs"),
        .init(
          profileImageURL: UIImage(named: "angeli"),
          name: "Angeli Khan",
          work: "Selina's Gold, Eva, Silip Sa Apoy"),
        .init(
          profileImageURL: UIImage(named: "angeli"),
          name: "Angeli Khan",
          work: "Selina's Gold, Eva, Silip Sa Apoy"),
        .init(
          profileImageURL: UIImage(named: "angeli"),
          name: "Angeli Khan",
          work: "Selina's Gold, Eva, Silip Sa Apoy"),
        .init(
          profileImageURL: UIImage(named: "angeli"),
          name: "Angeli Khan",
          work: "Selina's Gold, Eva, Silip Sa Apoy"),

      ]
    }
  }
}
