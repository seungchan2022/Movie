import Foundation

public struct MovieAPI {
  // 여기 Int가 페이지 넘버인건가?
  public var getListTask: @Sendable (Int) async throws -> MovieAPIModel.PlayList.Response
  
  public init(
    getListTask: @Sendable @escaping (Int) async throws -> MovieAPIModel.PlayList.Response)
  {
    self.getListTask = getListTask
  }
}
