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
  
  var filteredItems: [MovieListViewModel.State.ScopeItem] {
     if keyword.isEmpty {
       return state.itemList
     } else {
       return state.itemList.filter {
         $0.title.lowercased().contains(keyword.lowercased())
       }
     }
   }

    
  var body: some View {
    ScrollView {
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
                .stroke(.gray.opacity(0.2), lineWidth: 1))
            .focused($isFocused, equals: true)
              
          if !keyword.isEmpty {
            Button(action: { keyword = "" }) {
              Text("Cancel")
                .foregroundColor(.red)
            }
          }
        }
        .padding(.horizontal, 8)
        
        // 리스트
        //      Spacer()
        //      Text("Movie list page")
        //
        //      Button(action: { viewModel.send(action: .onTapDiscover)}) {
        //        Text("디스커버리로 이동")
        //      }
        VStack {
          ForEach(filteredItems, id: \.title) { item in
            HStack(spacing: 16) {
              Image(uiImage: item.imageURL ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 160)
                .clipShape(RoundedRectangle(cornerRadius: 10))
              
              VStack(alignment: .leading, spacing: 16) {
                Spacer()
                Text(item.title)
                  .font(.system(size: 18, weight: .medium))
                  .foregroundColor(.yellow)
                
                HStack(spacing: 5) {
                  Image(systemName: "star.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 16, height: 16)
                    .foregroundColor(Color(.systemRed))
                  
                  Text(String(format: "%.1f", item.rate))
                  
                  Text(item.date)
                }
                .font(.system(size: 16, weight: .medium))
                
                Text(item.summary)
                  .font(.system(size: 16, weight: .medium))
                  .foregroundColor(.gray)
                
                
                Spacer()
              }
              
              Spacer()
            }
            .frame(height: 200)
            .onTapGesture {
              viewModel.send(action: .onTapMovieDetailPage)
            }
          }
        }
        //      Spacer()
      }
    } // 전체 view
    .onAppear {
      viewModel.send(action: .loadItemList)
    }
    .navigationTitle("Now Playing")
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
