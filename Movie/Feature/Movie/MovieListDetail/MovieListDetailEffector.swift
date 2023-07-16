import Foundation
import UIKit

struct MovieListDetailEffector {
  
  let navigator: NavigatorType
  let diContainer: DIContainerType
}

extension MovieListDetailEffector {
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
  
  var itemList: () async -> [MovieListDetailStore.State.ScopeItem] {
    {
      let _ = try? await Task.sleep(for: .zero)
      
      return [
        .init(
          id: "fastx",
          title: "분노의 질주",
          imageURL: UIImage(named: "fastx"),
          year: 2023,
          runningTime: 142,
          release: "Released United States of America",
          rate: 3.5,
          comments: 2614),
        .init(
          id: "transformer",
          title: "트랜스포머",
          imageURL: UIImage(named: "transformer"),
          year: 2023,
          runningTime: 127,
          release: "Released United States of America",
          rate: 4.1,
          comments: 1133),
        
          .init(
            id: "spiderman",
            title: "스파이더맨",
            imageURL: UIImage(named: "spiderman"),
            year: 2023,
            runningTime: 140,
            release: "Released United States of America",
            rate: 4.7,
            comments: 2246),
      ]
    }
  }
}

