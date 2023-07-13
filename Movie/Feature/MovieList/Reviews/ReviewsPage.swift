import Foundation
import SwiftUI

struct ReviewsPage {
  @ObservedObject var viewModel: ReviewsViewModel
  
}

extension ReviewsPage: View {
  var body: some View {
    Text("review page")
  }
}

