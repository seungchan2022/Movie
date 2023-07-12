import Foundation
import UIKit

protocol FeatureBuildType {
  var featureName: String { get }
  func build(items: [String: String], diContainer: DIContainerType, navigator: NavigatorType) -> UIViewController
}
