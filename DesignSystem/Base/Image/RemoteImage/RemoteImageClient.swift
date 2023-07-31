import Foundation
import UIKit

final class RemoteImageClient: ObservableObject {

  @Published var image: UIImage? = .none
  private var downloadTask: Task<Void, Never>? = .none
}

extension RemoteImageClient {
  func load(imageURL: String, size: CGSize) {
    guard let url = URL(string: imageURL) else { return }
    if let cacheImage = ImageCache.shared.get(url: url, newSize: size) {
      Task {
        await rendering(image: cacheImage)
      }
      return
    }

    cancel()
    downloadTask = Task { [weak self] in
      do {
        let (data, _) = try await URLSession.shared.data(for: .init(url: url))
        guard let image = UIImage(data: data) else { return }
        ImageCache.shared.set(url: url, image: image)
        guard let cacheImage = ImageCache.shared.get(url: url, newSize: size) else { return }
        await self?.rendering(image: cacheImage)
      } catch {
        print("이미지 다운로드 에러 ", error)
      }
    }
  }

  func cancel() {
    downloadTask?.cancel()
  }
}

extension RemoteImageClient {
  @MainActor
  func rendering(image: UIImage?) {
    defer { objectWillChange.send() }
    self.image = image
  }
}
