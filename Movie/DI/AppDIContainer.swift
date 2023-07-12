import Foundation
import UIKit

// tabbar에 item 설정
public struct AppDIContainer {
  
  func production() -> [NavigatorType] {
    [
      TabNavigator(
        tabName: "Movies",
        defaultFeatureName: Link.movieList.rawValue,
        defaultItems: [:],
        defaultImage: UIImage(systemName: "film.fill"),
        diContainer: UseCaseDIContainer(),
        featureBuilderList: FeatureDIContainer().production),
      
      TabNavigator(
        tabName: "Discover",
        defaultFeatureName: Link.discoverList.rawValue,
        defaultItems: ["itemList":"원본 페이지"],
        defaultImage: UIImage(systemName: "square.stack.fill"),
        diContainer: UseCaseDIContainer(),
        featureBuilderList: FeatureDIContainer().production),
      
      TabNavigator(
        tabName: "FanClub",
        defaultFeatureName: Link.fanClubList.rawValue,
        defaultItems: [:],
        defaultImage: UIImage(systemName: "star.circle.fill"),
        diContainer: UseCaseDIContainer(),
        featureBuilderList: FeatureDIContainer().production),
      
      TabNavigator(
        tabName: "MyLists",
        defaultFeatureName: Link.myListsList.rawValue,
        defaultItems: [:],
        defaultImage: UIImage(systemName: "heart.circle.fill"),
        diContainer: UseCaseDIContainer(),
        featureBuilderList: FeatureDIContainer().production),
    ]
  }
}
