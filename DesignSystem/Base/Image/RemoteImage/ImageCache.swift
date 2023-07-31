import Foundation
import UIKit

final class ImageCache {

  public static let shared = ImageCache()

  private let cache: NSCache<NSURL, AnyObject> = {
    let cache = NSCache<NSURL, AnyObject>()
    cache.countLimit = Limit.count
    cache.totalCostLimit = Limit.memory
    return cache
  }()
}

extension ImageCache {

  public func get(url: URL, newSize: CGSize = UIScreen.main.bounds.size) -> UIImage? {
    let image = cache.object(forKey: url as NSURL) as? UIImage
    return image?.resizing(size: newSize)
  }

  public func set(url: URL, image: UIImage) {
    if get(url: url) != .none {
      cache.removeObject(forKey: url as NSURL)
    }
    // 디코딩된 이미지를 세팅
    // 로드 - 디코드 - 렌더링 => 이 구조가 되기 위해
    let newImage = image.decodeImage().resizing()
    cache.setObject(newImage as AnyObject, forKey: url as NSURL)
  }
}

extension ImageCache {
  private enum Limit {
    static let count = 200
    static let memory = 1024 * 1024 * 100 // 100mb
  }
}

extension UIImage {
  fileprivate func decodeImage() -> UIImage {
    guard let cgImage else { return self }

    let size = CGSize(width: cgImage.width, height: cgImage.height)
    let colorSpace = CGColorSpaceCreateDeviceRGB()
    let context = CGContext(
      data: .none,
      width: Int(size.width),
      height: Int(size.height),
      bitsPerComponent: 8,
      bytesPerRow: cgImage.bytesPerRow,
      space: colorSpace,
      bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue)
    context?.draw(cgImage, in: .init(origin: .zero, size: size))
    guard let decodedImage = context?.makeImage() else { return self }
    return UIImage(cgImage: decodedImage)
  }

  func resizing(size: CGSize = UIScreen.main.bounds.size) -> UIImage {
    guard let cgImage else { return self }
    let newSize = CGSize(
      width: size.width * UIScreen.main.scale,
      height: size.height * UIScreen.main.scale)
    let realSize = CGSize(
      width: cgImage.width,
      height: cgImage.height)

    guard cgImage.width > Int(size.width), cgImage.height > Int(size.height)
    else { return self }

    return cgImage.width > cgImage.height
      ? resizing(new: realSize.resizingWidth(max: newSize.width))
      : resizing(new: realSize.resizingHeight(max: newSize.height))
  }
}

extension UIImage {
  private func resizing(new: CGSize) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(new, false, .zero)
    defer { UIGraphicsEndImageContext() }
    draw(in: .init(origin: .zero, size: new))
    return UIGraphicsGetImageFromCurrentImageContext() ?? self
  }
}

extension CGSize {
  func resizingWidth(max: CGFloat) -> Self {
    let ratio = max / width
    return .init(width: width * ratio, height: height * ratio)
  }

  func resizingHeight(max: CGFloat) -> Self {
    let ratio = max / height
    return .init(width: width * ratio, height: height * ratio)
  }
}
