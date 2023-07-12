import Foundation
import SwiftUI

struct MovieListPage {
  // 네비게이션 버튼을 눌렀을때 버튼 이미지가 달라지고 보이는 화면이 다르게 하기위해
  @State private var isButtonClicked = false
  @ObservedObject var viewModel: MovieListViewModel
  @State private var keyword = ""
  @FocusState private var isFocused
}

extension MovieListPage {
  var state: MovieListViewModel.State {
    viewModel.state
  }
}

extension MovieListPage: View {
  var body: some View {
    // 서치
    VStack {
      HStack(spacing: 15) {
        Image(systemName: "magnifyingglass")
          .renderingMode(.template)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 20, height: 20)
        
        TextField("Search any movie or person", text: $keyword)
          .textFieldStyle(.plain)
          .frame(height: 40)
          .padding(.horizontal)
          .background(
            RoundedRectangle(cornerRadius: 5)
              .stroke(.gray.opacity(0.7), lineWidth: 1))
        
          .focused($isFocused, equals: true)
        if !keyword.isEmpty {
          Button(action: { keyword = "" }) {
            Text("Cancel")
              .foregroundColor(.red)
          }
        }
      }
      .padding(.horizontal, 8)
    }
    .padding(.horizontal)
    
    // 리스트
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
      viewModel.send(action: .loadItemList)
    }
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        Button(action: { print("Setting")}) {
          Image(systemName:"wrench.adjustable")
          
        }
      }
    }
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        Button(action: { isButtonClicked.toggle() }) {
            Image(systemName: isButtonClicked ?  "rectangle.grid.1x2" : "rectangle.3.group.fill")
        }
      }
    }
  }
}
