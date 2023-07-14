import SwiftUI

struct RootNavigator {
  let viewController: UINavigationController
}

extension RootNavigator: UIViewControllerRepresentable {
  func makeUIViewController(context: Context) -> UINavigationController {
    viewController
  }
  
  func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
  }
}

