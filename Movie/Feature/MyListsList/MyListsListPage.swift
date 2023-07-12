import Foundation
import SwiftUI

// movies의 데이터와 같은데 여기서는 위시리스트랑 씬리스트로 나누어서 구분 하는 것뿐 -> 보이는 UI와 눌렀을때 보이는 것은 같음 => 어떻게 구조를 짜야되나... => 일단 각자 구성하고 나중에 재사용되는 부분 정리해서 표현해보기
struct MyListsListPage {
  @ObservedObject var viewModel: MyListsListViewModel
}

extension MyListsListPage {
  var state: MyListsListViewModel.State {
    viewModel.state
  }
  
  private var isShowSheet: Binding<Bool> {
    .init(
      get: { state.isShowSheet },
      set: { viewModel.send(action: .onChangeSheet($0)) })
  }
}

extension MyListsListPage: View {
  var body: some View {
    VStack {
      Spacer()
      Text("My Lists list page")
      
      if !state.isShowSheet {
        Button(action: { viewModel.send(action: .onChangeSheet(true)) }) {
          Text("시트 띄우기")
        }
      }
      
      ScrollView {
        VStack {
          ForEach(state.itemList, id: \.title) { item in
            Text(item.title)
          }
        }
      }
      Spacer()
    }
    .onAppear {
      viewModel.send(action: .loadItemList)
    }
    .sheet(isPresented: isShowSheet) {
      Text("시트 페이지")
    }
  }
}
