import Foundation

public enum CompositeError: Error, Equatable, LocalizedError {

  case invalidURL
  case invalidTypeCasting
  case networkError
  case other(Error)


  public var errorDescription: String? {
    switch self {
    case .invalidURL: return "잘못된 URL입니다"
    case .invalidTypeCasting: return "타입변환 실패했어요~"
    case .networkError: return "통신 확인바랍니다."
    case .other(let error): return error.localizedDescription
    }
  }

  public static func == (lhs: Self, rhs: Self) -> Bool {
    lhs.errorDescription == rhs.errorDescription
  }
}

extension Error {
  public func serialized() -> CompositeError {
    guard let error = self as? CompositeError else { return .other(self) }
    return error
  }
}
