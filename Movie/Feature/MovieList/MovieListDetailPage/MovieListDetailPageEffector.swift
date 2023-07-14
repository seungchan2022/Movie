import Foundation
import UIKit

struct MovieListDetailPageEffector {
  
  let navigator: NavigatorType
  let diContainer: DIContainerType
}

extension MovieListDetailPageEffector {
  var routeToReviews: () -> Void {
    {
      navigator.push(
        featureName: Link.reviews.rawValue,
        items: [:],
        isAnimation: true)
    }
  }
  
  var routeToCastList: () -> Void {
    {
      navigator.push(
        featureName: Link.castList.rawValue,
        items: [:],
        isAnimation: true)
    }
  }
  
  var routeToDirector: () -> Void {
    {
      navigator.push(
        featureName: Link.director.rawValue,
        items: [:],
        isAnimation: true)
    }
  }
}

