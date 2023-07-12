import Foundation
import UIKit

struct MovieListEffector {
  
  let navigator: NavigatorType
  let diContainer: DIContainerType
}


extension MovieListEffector {
  var routeToDiscover: () -> Void {
    {
      navigator.push(
        featureName: Link.discoverList.rawValue,
        items: ["itemList": "네비게이터를 통해 보여질 페이지"],
        isAnimation: true)
    }
  }
  
  func getItemList(callback: @escaping ([MovieListViewModel.State.ScopeItem]) -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
      callback([
        .init(
          imageURL: UIImage(named: "fastx"),
          title: "분노의 질주",
          date: .init(),
          rate: 3.5,
          summary: "돔과 그의 패밀리 앞에 나타난 운명의 적 단테, 관거의 그림자는 돔의 모든 것을 파괴하기 위해 달려온다. 단테에 의해 산산히 흩어진 패밀리들은 모두 목숨을 걸고 맞서야 하는 함점에 빠지고 마는데..."),
        .init(
          imageURL: UIImage(named: "transformer"),
          title: "트랜스포머",
          date: .init(),
          rate: 4.1,
          summary: "전 우주의 행성을 집어삼기는"),
        .init(
          imageURL: UIImage(named: "spiderman"),
          title: "스파이더맨",
          date: .init(),
          rate: 4.7,
          summary: "여러 성장통을 걲으며 새로운 스파이더맨이 된 마일스.."),
      ])
    }
  }
}
