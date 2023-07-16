import Foundation
import UIKit

final class DirectorPageViewModel: ObservableObject {
  
  private let effector: DirectorPageEffector
  
  init(
    effector: DirectorPageEffector)
  {
    self.effector = effector
  }
}
