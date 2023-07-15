import Foundation
import UIKit

struct ProfileEffector {
  let navigator: NavigatorType
  let diContainer: DIContainerType
}

extension ProfileEffector {
  var routeToMovieDetail: () -> Void {
    {
      navigator.push(
        featureName: Link.movieListDetail.rawValue,
        items: [:],
        isAnimation: true)
    }
  }
  
  func getItemList(callback: @escaping ([ProfileViewModel.State.ScopeItem]) -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now()) {
      callback([
        .init(image: UIImage(named: "fastx"), title: "분노의 질주"),
        .init(image: UIImage(named: "transformer"), title: "트랜스포머"),
        .init(image: UIImage(named: "spiderman"), title: "스파이더맨"),
      ])
    }
  }
}
