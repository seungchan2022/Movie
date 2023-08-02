import Foundation

public struct MovieAPI {
  // 여기 Int가 페이지 넘버인건가? => 페이지 번호를 날려서 그에 해당 하는 아이템이 나오도록
  public var getListTask: @Sendable (Int) async throws -> MovieAPIModel.PlayList.Response
  
  public init(
    getListTask: @Sendable @escaping (Int) async throws -> MovieAPIModel.PlayList.Response)
  {
    self.getListTask = getListTask
  }
}

public struct MovieDetailAPI {
  // 여기서 던지는 Int는 해당 movie의 id?
  public var getDetailTask: @Sendable (String) async throws -> MovieAPIModel.Detail.Movie.Response
  
  public init(
    getDetailTask: @Sendable @escaping (String) async throws -> MovieAPIModel.Detail.Movie.Response) {
    self.getDetailTask = getDetailTask
  }
}

public struct ReviewAPI {
  public var getReviewTask: @Sendable (String) async throws -> MovieAPIModel.Detail.Review.Response
  
  public init(
    getReviewTask: @Sendable @escaping (String) async throws -> MovieAPIModel.Detail.Review.Response) {
    self.getReviewTask = getReviewTask
  }
}

public struct CreditAPI {
  public var getCreidtTask: @Sendable (String) async throws -> MovieAPIModel.Detail.Credit.Response
  
  public init(
    getCreidtTask: @Sendable @escaping (String) async throws -> MovieAPIModel.Detail.Credit.Response) {
    self.getCreidtTask = getCreidtTask
  }
}
