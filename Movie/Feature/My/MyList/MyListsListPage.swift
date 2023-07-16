import Foundation
import SwiftUI

// movies의 데이터와 같은데 여기서는 위시리스트랑 씬리스트로 나누어서 구분 하는 것뿐 -> 보이는 UI와 눌렀을때 보이는 것은 같음 => 어떻게 구조를 짜야되나... => 일단 각자 구성하고 나중에 재사용되는 부분 정리해서 표현해보기
struct MyListsListPage {
  @ObservedObject var viewStore: MyListsListStore
//  @State private var isShowingWishList = true
//  @State private var isShowingSeenList = false
}

extension MyListsListPage {
  var state: MyListsListStore.State {
    viewStore.state
  }
  
  private var isShowSheet: Binding<Bool> {
    .init(
      get: { state.isShowSheet },
      set: { viewStore.send(.onChangeSheet($0)) })
  }
}

extension MyListsListPage: View {
  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        VStack(alignment: .leading) {
          Text("CUSTOM LISTS")
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(.gray)
            .padding(.horizontal, 10)
          if !state.isShowSheet {
            Button(action: { viewStore.send( .onChangeSheet(true)) }) {
              Text("Create Custom list")
                .font(.system(size: 18, weight: .medium))
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 40)
                .padding(.horizontal)
                .background(Color.gray.opacity(0.3))
                .foregroundColor(Color(.systemMint).opacity(0.5))
            }
          }
        }
        .padding(.bottom, 20)
        
        
        ZStack {
          Color.gray.opacity(0.3)
            .frame(height: 40)
          
          HStack(spacing: 0) {
            Button {
//              isShowingWishList = true
//              isShowingSeenList = false
              viewStore.send(.onChangeShowType(.wishList))
            } label: {
              Text("Wishlist")
            }
            .frame(width: 150, height: 30)
            //        .clipShape(Capsule())
            .background(state.showType == .wishList ? Color.gray.opacity(0.7) : Color.gray.opacity(0.3))
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Button {
//              isShowingSeenList = true
//              isShowingWishList = false
              viewStore.send(.onChangeShowType(.seenList))
            } label: {
              Text("Seenlist")
            }
            .frame(width: 150, height: 30)
            .background(state.showType == .seenList ? Color.gray.opacity(0.7) : Color.gray.opacity(0.3))
            .foregroundColor(.white)
            .cornerRadius(10)
          }
          
        } // ZStack
        .padding(.bottom, 20)
        
        // => wishlist를 누르면 wishlistpage가 나오고
        
        VStack(alignment: .leading) {
          if state.showType == .wishList {
            Text("\(state.itemList.count) MOVES IN WISHLIST (BY RELEASE DATE)")
              .font(.system(size: 14, weight: .medium))
              .foregroundColor(.gray)
              .padding(.horizontal, 10)
            
            ScrollView {
              VStack {
                ForEach(state.itemList, id: \.title) { item in
                  HStack {
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
                }
                .frame(height: 180)
              }
            }
          }
          
          if state.showType == .seenList  {
            Text("2 MOVES IN WISHLIST (BY RELEASE DATE)")
              .font(.system(size: 14, weight: .medium))
              .foregroundColor(.gray)
              .padding(.horizontal, 10)
            
            ScrollView {
              VStack {
                ForEach(state.itemList[0..<2], id: \.title) { item in
                  HStack {
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
                }
                .frame(height: 180)
              }
              
            }
          }
        } // wishlist, seenlist
        .onTapGesture {
          viewStore.send(.onShowMovieDetail)
        }
        
      } // 전체 vstack
    } // 전체 scrollView
    
    .sheet(isPresented: isShowSheet) {
      CustomListsPage()
    }
    
    .navigationTitle("My Lists")
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        Button(action: { print("Setting")}) {
          Image(systemName:"line.3.horizontal.decrease.circle")
          
        }
      }
    }
    .onAppear {
      viewStore.send(.loadItemList)
    }
  }
}
