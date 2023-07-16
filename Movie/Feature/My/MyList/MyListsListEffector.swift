import Foundation
import UIKit

struct MyListsListEffector {
  let navigator: NavigatorType
  let diContainer: DIContainerType
}

extension MyListsListEffector {
  // 디테일 페이지 => 만들었던것 재사용
  var routeToMovieDetail: () -> Void {
    {
//      DispatchQueue
      navigator.push(
        featureName: Link.movieListDetail.rawValue,
        items: [:],
        isAnimation: true)
    }
  }
  
//  var routeToMovieDetailPage: (MovieListStore.State.ScopeItem) -> Void {
//    { item in
//      DispatchQueue.main.async {
//        navigator.push(
//          featureName: Link.movieListDetail.rawValue,
//          items: ["movieItemID": item.id],
//          isAnimation: true)
//      }
//    }
//  }
  
  // 영화 데이터
  var itemList: () async -> [MyListsListStore.State.ScopeItem] {
    {
      let _ = try? await Task.sleep(for: .seconds(1.5))
      
      return [
        .init(
          id: "fastx",
          imageURL: UIImage(named: "fastx"),
          title: "분노의 질주",
          date: "5/17/23",
          rate: 3.5,
          summary: "돔과 그의 패밀리 앞에 나타난 운명의 적 단테, 관거의 그림자는 돔의 모든 것을 파괴하기 위해 달려온다. 단테에 의해 산산히 흩어진 패밀리들은 모두 목숨을 걸고 맞서야 하는 함점에 빠지고 마는데..."),
        .init(
          id: "transformer",
          imageURL: UIImage(named: "transformer"),
          title: "트랜스포머",
          date: "6/6/23",
          rate: 4.1,
          summary: "전 우주의 행성을 집어삼기는 절대자, '유니크론'의 부하 '스커지'는 '테러톤'들을 이끌고 지구에 당도한다. 그에 맞서기 위해 지구에 정체를 숨기고 있던 트랜스포머 '오토봇' 군단이 모습을 드러내고 또 다른 트랜스포머 진영인 '맥시멀'과 힘을 합친다. 옵티머스 프라임이 이끄는 '오토봇'과 옵티머스 프라이멀을 중심으로 한 '맥시멀'. 모두의 운명을 건 그들의 압도적 전투가 시작된다.!"),
        .init(
          id: "spiderman",
          imageURL: UIImage(named: "spiderman"),
          title: "스파이더맨",
          date: "6/2/23",
          rate: 4.7,
          summary: "여러 성장통을 걲으며 새로운 스파이더맨이 된 마일스 모랄레스. 그 앞에 다른 평행세계의 스파이더우먼 그웬이 다시 나타난다. 모든 차원의 멀티버스 속 스파이더맨들을 만나게 되지만, 질서에 대한 신념이 부딪히며 예상치 못한 균열이 생기는데... 상상 그 이상을 넘어서는 멀티버스의 세계가 열린다!"),
      ]
    }
  }
}
