import Foundation

public struct FetchData<ValueType: Equatable> {
  public var isLoading: Bool
  public var value: ValueType

  public init(isLoading: Bool = false, value: ValueType) {
    self.isLoading = isLoading
    self.value = value
  }
}

extension FetchData: Equatable {
  public static func == (lhs: Self, rhs: Self) -> Bool {
    lhs.isLoading == rhs.isLoading
    && lhs.value == rhs.value
  }
}
