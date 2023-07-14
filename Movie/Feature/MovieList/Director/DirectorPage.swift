import Foundation
import SwiftUI

struct DirectorPage {
  @ObservedObject var viewModel: DirectorPageViewModel
}

extension DirectorPage: View {
  var body: some View {
    Text("Director Page")
  }
}
