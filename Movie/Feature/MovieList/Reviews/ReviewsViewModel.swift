import Foundation
import UIKit

final class ReviewsViewModel: ObservableObject {
  
  private let effector: ReviewsEffector
  
  init(effector: ReviewsEffector) {
    self.effector = effector
  }
}
