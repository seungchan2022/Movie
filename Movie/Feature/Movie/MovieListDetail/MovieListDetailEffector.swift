import Foundation
import UIKit

struct MovieListDetailEffector {
  
  let navigator: NavigatorType
  let diContainer: DIContainerType
}

extension MovieListDetailEffector {
  @MainActor
  var routeToReviews: (MovieListDetailStore.State.ScopeItem) -> Void {
    { item in
//      DispatchQueue.main.async {
        navigator.push(
          featureName: Link.reviews.rawValue,
          items: ["movieItemID": item.id],
          isAnimation: true)
//      }
    }
  }
  
  @MainActor
  var routeToCastList: (MovieListDetailStore.State.ScopeItem) -> Void {
    { item in
//      DispatchQueue.main.async {
        navigator.push(
          featureName: Link.castList.rawValue,
          items: ["movieItemID": item.id],
          isAnimation: true)
//      }
    }
  }
  
  @MainActor
  var routeToDirector: (MovieListDetailStore.State.ScopeItem) -> Void {
    { item in
//      DispatchQueue.main.async {
        navigator.push(
          featureName: Link.director.rawValue,
          items: ["movieItemID": item.id],
          isAnimation: true)
//      }
    }
  }
  
  var itemList: () async -> [MovieListDetailStore.State.ScopeItem] {
    {
      let _ = try? await Task.sleep(for: .zero)
      
      return [
        .init(
          id: "fastx",
          title: "분노의 질주",
          imageURL: UIImage(named: "fastx"),
          year: 2023,
          runningTime: 142,
          release: "Released United States of America",
          rate: 3.5,
          comments: 2614,
          geners: ["액션", "범죄", "스릴러"],
          reviews: "7 reviews",
          overview: "돔(빈 디젤)과 그의 패밀리 앞에 나타난 운명의 적 단테(제이슨 모모아). 과거의 그림자는 돔의 모든 것을 파괴하기 위해 달려온다. 단테에 의해 산산히 흩어진 패밀리들은 모두 목숨을 걸고 맞서야 하는 함정에 빠지고 마는데...",
          keywords: ["Sequel", "Revenge", "Racing", "Family", "Cars"],
          director: "Louis Leterrier"
//        cast: ["jason", "djkfjdfk"]
        ),
        
          .init(
          id: "transformer",
          title: "트랜스포머",
          imageURL: UIImage(named: "transformer"),
          year: 2023,
          runningTime: 127,
          release: "Released United States of America",
          rate: 4.1,
          comments: 1133,
          geners: ["액션", "모험", "SF"],
          reviews: "6 reviews",
          overview: "전 우주의 행성을 집어삼키는 절대자, ‘유니크론’의 부하 ‘스커지’는 ‘테러콘’들을 이끌고 지구에 당도한다. 그에 맞서기 위해 지구에 정체를 숨기고 있던 트랜스포머 ‘오토봇’ 군단이 모습을 드러내고 또 다른 트랜스포머 진영인 ‘맥시멀’과 힘을 합친다. 옵티머스 프라임이 이끄는 ‘오토봇’과 옵티머스 프라이멀을 중심으로 한 ‘맥시멀’.모두의 운명을 건 그들의 압도적 전투가 시작된다!",
          keywords: ["Peru", "Alien", "End Of The World", "Robot", "Duringcreditsstinger", "1990S", "Brother Brother Relationship"],
          director: "Anthony Leonardi lll"
//          cast: ["jadfdfdfson", "djkf333jdfk"]
          ),
        
          .init(
            id: "spiderman",
            title: "스파이더맨",
            imageURL: UIImage(named: "spiderman"),
            year: 2023,
            runningTime: 140,
            release: "Released United States of America",
            rate: 4.7,
            comments: 2246,
            geners: ["액션", "모험", "애니메이션", "SF"],
            reviews: "6 reviews",
            overview: "여러 성장통을 겪으며 새로운 스파이더맨이 된 ‘마일스 모랄레스’. 그 앞에 다른 평행세계의 스파이더우먼 ‘ 그웬’이 다시 나타난다. 모든 차원의 멀티버스 속 스파이더맨들을 만나게 되지만, 질서에 대한 신념이 부딪히며 예상치 못한 균열이 생기는데… 상상 그 이상을 넘어서는 멀티버스의 세계가 열린다! ",
            keywords: ["Sacrifice", "Villain",
                      "Comic Book", "Sequel", "Superhero", "Based on Comic"],
            director: "Joaquim Dos Santos"
//            cast: ["jaso22222n", "djkf6778888898jdfk"]
          ),
      ]
    }
  }
}

