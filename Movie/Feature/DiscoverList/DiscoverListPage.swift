import Foundation
import SwiftUI

struct DiscoverListPage {
  @ObservedObject var viewStore: DiscoverListStore
}

extension DiscoverListPage {
  var state: DiscoverListStore.State {
    viewStore.state
  }
  
  private var isShowSheet: Binding<Bool> {
    .init(
      get: { state.isShowSheet },
      set: { viewStore.send(.onChangeSheet($0)) })
  }

}

extension DiscoverListPage: View {
  var body: some View {
    VStack{
      Spacer()
      Text("Discover list page")
      Text("Item is \(state.itemList)")
      
      if state.itemList.isEmpty {
        Button(action: { viewStore.send( .onTapItemListReset)}) {
          Text("아이템 복구")
        }
      } else {
        Button(action: { viewStore.send( .onTapItemListClear)}) {
          Text("아이템 지워줘")
        }
      }
      
      if !state.isShowSheet {
        Button(action: { viewStore.send( .onChangeSheet(true))}) {
          Text("시트를 띄워줘")
        }
      }
      Spacer()
    }
    .sheet(isPresented: isShowSheet) {
      Text("시트 페이지")
      
      Button(action: { viewStore.send( .onChangeSheet(false)) }) {
        Text("버튼으로 시트 닫기")
      }
    }
  }
}
