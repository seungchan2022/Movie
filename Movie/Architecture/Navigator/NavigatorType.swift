import SwiftUI

protocol NavigatorType {
  var tabName: String { get }
  var defaultFeatureName: String { get }
  var defaultItems: [String: String] { get }
  var defaultImage: UIImage? { get }
  
  func launch(featureName: String, items: [String: String]) -> UIViewController
  func push(featureName: String, items: [String: String], isAnimation: Bool)
  func back(isAnimation: Bool)
}
