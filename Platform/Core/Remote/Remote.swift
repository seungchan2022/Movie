import Foundation

struct Remote: Sendable {
  
  let session: URLSession
  
  init(session: URLSession = .shared) {
    self.session = session
  }
}

extension Remote {
  // fetch: url을 통해 데이터를 불러오는 것
  func fetch(url: URL?) async throws -> Data {
    guard let url else { throw CompositeError.invalidURL } // 잘못된 URL

    // 어떤 URL을 불러왔는지 확인하기 위해
    print("Fetch! url", url.absoluteString)
    
    let (data, response) = try await session.data(from: url)

    guard let status = response as? HTTPURLResponse
    else { throw CompositeError.invalidTypeCasting }     // URL을 받아왔는데 타입 캐스팅을 잘못함

    guard (200...299).contains(status.statusCode)
    else { throw CompositeError.networkError}            // networkError

    return data
//    return try await session.data(for: .init(url: url)).0
  }
}
