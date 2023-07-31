import Foundation
import SwiftUI

public struct RemoteImage{

  @StateObject private var client = RemoteImageClient()

  let url: String
  let placeholder: Image?

  public init(
    url: String,
    placeholder: (() -> Image)? = .none)
  {
    self.url = url
    self.placeholder = placeholder?()
  }
}

extension RemoteImage: View {

  public var body: some View {
    GeometryReader { proxy in
      Group {
        if let image = client.image {
          Image(uiImage: image)
            .resizable()
        } else if let placeholder{
          placeholder
        } else {
          Rectangle()
            .fill(Color.gray)
        }
      }
      .onAppear {
        client.load(imageURL: url, size: proxy.size)
      }
      .onDisappear {
        client.cancel()
      }
    }
  }
}
