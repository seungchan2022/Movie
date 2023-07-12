import Foundation
import SwiftUI

struct MovieListPage {
  @ObservedObject var viewModel: MovieListViewModel
}

extension MovieListPage {
  var state: MovieListViewModel.State {
    viewModel.state
  }
}

extension MovieListPage: View {
  var body: some View {
    VStack {
      Spacer()
      Text("Movie list page")
      
      Button(action: { viewModel.send(action: .onTapDiscover)}) {
        Text("디스커버리로 이동")
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
      viewModel.send(action: .loadItamList)
    }
  }
}
