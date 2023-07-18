//{
//  ScrollView {
//    VStack {
//      Text("무비 아이디: \(state.movieItemID)")
//      // 위의 그룹
//      VStack {
//
//        Group {
//          VStack(alignment: .leading, spacing: 10) {
//            Spacer()
//            HStack {
//              Image("fastx")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: 100, height: 160)
//                .clipShape(RoundedRectangle(cornerRadius: 10))
//
//              VStack {
//                Spacer()
//                Text("2023 * 142 minutes * Released United State of America")
//
//                HStack(spacing: 5) {
//                  Image(systemName: "star.fill")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 16, height: 16)
//                    .foregroundColor(Color(.systemRed))
//
//                  Text("3.5")
//                  Text("2,614 ratings")
//
//                  Spacer()
//                }
//                .font(.system(size: 16, weight: .medium))
//
//                Spacer()
//              }
//            } // 앞에랑 같은것
//
//            Spacer()
//
//            // 장르버튼
//            HStack {
//              Button {
//                print("액션")
//              } label: {
//                Text("액션")
//                  .font(.subheadline)
//                  .fontWeight(.bold)
//                Image(systemName: "chevron.right")
//                  .resizable()
//                  .scaledToFit()
//                  .frame(width: 10, height: 10)
//              }
//              .padding(.horizontal, 4)
//              .foregroundColor(.white)
//              .frame(width: 80, height: 25)
//              .background(
//                RoundedRectangle(cornerRadius: 10)
//                  .fill(.black)
//              )
//
//              Button {
//                print("범죄")
//              } label: {
//                Text("범죄")
//                  .font(.subheadline)
//                  .fontWeight(.bold)
//                Image(systemName: "chevron.right")
//                  .resizable()
//                  .scaledToFit()
//                  .frame(width: 10, height: 10)
//              }
//              .padding(.horizontal, 4)
//              .foregroundColor(.white)
//              .frame(width: 80, height: 25)
//              .background(
//                RoundedRectangle(cornerRadius: 10)
//                  .fill(.black)
//              )
//
//              Button {
//                print("스릴러")
//              } label: {
//                Text("스릴러")
//                  .font(.subheadline)
//                  .fontWeight(.bold)
//                Image(systemName: "chevron.right")
//                  .resizable()
//                  .scaledToFit()
//                  .frame(width: 10, height: 10)
//              }
//              .padding(.horizontal, 4)
//              .foregroundColor(.white)
//              .frame(width: 80, height: 25)
//              .background(
//                RoundedRectangle(cornerRadius: 10)
//                  .fill(.black)
//              )
//
//              Spacer()
//            } // 장르 버튼
//            .padding(.horizontal, 8)
//            .padding(.bottom, 16)
//            Spacer()
//
//          } // vstack
//          .padding(.horizontal, 16)
//        } // group
//        .frame(height: 260)
//        //      .background(Color(.gray).opacity(0.2))
//        .background(
//          RadialGradient(
//            colors: [Color.gray.opacity(0.5), Color.gray.opacity(0.3)],
//            center: .center,
//            startRadius: 5,
//            endRadius: 200
//          )
//          .cornerRadius(10))
//
//        // wishlist, seenlist
//        HStack {
//          Button(action: {
//            wishListSelected.toggle()
//            seenListSelected = false
//          }) {
//            HStack(spacing: 2) {
//              if wishListSelected {
//                Image(systemName: "heart.fill")
//                  .renderingMode(.template)
//                  .foregroundColor(.white)
//                Text("In wishlist")
//                  .font(.subheadline)
//                  .fontWeight(.bold)
//                  .foregroundColor(.white)
//              } else {
//                Image(systemName: "heart")
//                  .foregroundColor(Color(.systemRed))
//                Text("Wishlist")
//                  .font(.subheadline)
//                  .fontWeight(.bold)
//                  .foregroundColor(Color(.systemRed))
//              }
//            }
//          }
//          .frame(width: wishListSelected ? 120 : 100, height: 30, alignment: .center)
//          .background(
//            RoundedRectangle(cornerRadius: 5)
//              .stroke(wishListSelected ? Color(.clear) : Color(.systemRed), lineWidth: 1)
//              .background(
//                RoundedRectangle(cornerRadius: 5)
//                  .fill(wishListSelected ? Color(.systemPink) : .clear)
//              )
//          )
//
//          Button(action: {
//            seenListSelected.toggle()
//            wishListSelected = false
//          }) {
//            HStack(spacing: 2) {
//              if seenListSelected {
//                Image(systemName: "eye.fill")
//                  .renderingMode(.template)
//                  .foregroundColor(.white)
//                Text("Seen")
//                  .font(.subheadline)
//                  .fontWeight(.bold)
//                  .foregroundColor(.white)
//              } else {
//                Image(systemName: "eye")
//                  .foregroundColor(Color(.systemGreen))
//                Text("Seenlist")
//                  .font(.subheadline)
//                  .fontWeight(.bold)
//                  .foregroundColor(Color(.systemGreen))
//              }
//            }
//          }
//          .frame(width: seenListSelected ? 80 : 100, height: 30, alignment: .center)
//          .background(
//            RoundedRectangle(cornerRadius: 5)
//              .stroke(seenListSelected ? Color(.clear) : Color(.systemGreen), lineWidth: 1)
//              .background(
//                RoundedRectangle(cornerRadius: 5)
//                  .fill(seenListSelected ? Color(.systemGreen) : .clear)
//              )
//          )
//
//          Button(action: {
//
//          }) {
//            HStack(spacing: 2) {
//              Image(systemName: "pin")
//              Text("List")
//            }
//          }
//          .frame(width: 60, height: 30, alignment: .center)
//          .foregroundColor(Color(.systemYellow))
//          .background(
//            RoundedRectangle(cornerRadius: 5)
//              .stroke(Color(.systemYellow), lineWidth: 1)
//          )
//
//          Spacer()
//        }
//        .padding(.horizontal, 16)
//
//        Divider()
//
//        HStack {
//          Text("7 reviews")
//            .font(.system(size: 18, weight: .medium))
//            .foregroundColor(Color(.systemMint).opacity(0.5))
//
//
//          Spacer()
//        }
//        .padding(.horizontal, 16)
//        .frame(height: 50)
//        // 왜 여기서 배경색을 설정하면 모든 프레임에서 되는데 배경색을 설정하지 않고 프레임 범위를 탭하면 탭 로직이 실행이 안되는 건가?
//        //        .background(Color(.systemBlue).opacity(0.1))
//        .onTapGesture {
//          // review page
//          print("tapp")
//          viewStore.send(.onTapReviews)
//        }
//
//        Divider()
//
//        HStack {
//          VStack(alignment: .leading, spacing: 8) {
//            Text("Overview:")
//              .font(.system(size: 18, weight: .bold))
//
//            Text(isOverviewTapped ? "돔과 그의 패밀리 앞에 나타난 운명의 적 단테, 관거의 그림자는 돔의 모든 것을 파괴하기 위해 달려온다. 단테에 의해 산산히 흩어진 패밀리들은 모두 목숨을 걸고 맞서야 하는 함점에 빠지고 마는데..." : "돔과 그의 패밀리 앞에 나타난 운명의 적 단테, 관거의 그림자는 돔의 모든 것을 파괴하기 위해 달려온다..")
//              .foregroundColor(Color(.gray))
//
//            Button(action: { isOverviewTapped.toggle()}) {
//              Text(isOverviewTapped ? "Less" : "Read more")
//                .font(.system(size: 18, weight: .medium))
//                .foregroundColor(Color(.systemMint).opacity(0.5))
//            }
//          }
//          Spacer()
//        }
//        .padding(.horizontal, 16)
//        .padding(.bottom, 10)
//
//      } // 위의 그룹
//      .background(Color(.gray).opacity(0.2))
//      .padding(.bottom, 20)
//
//      // 아래 그룹
//      VStack {
//
//        // 키워드
//        HStack {
//          Text("Keywords")
//            .font(.system(size: 18, weight: .bold))
//            .padding()
//          Spacer()
//        }
//        ScrollView(.horizontal, showsIndicators: false) {
//          HStack(spacing: 10) {
//            Button {
//              print("Sequel")
//            } label: {
//              Text("Sequel")
//                .font(.subheadline)
//                .fontWeight(.bold)
//              Image(systemName: "chevron.right")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 10, height: 10)
//            }
//            .padding(.horizontal, 4)
//            .foregroundColor(.white)
//            .frame(width: 100, height: 25)
//            .background(
//              RoundedRectangle(cornerRadius: 10)
//                .fill(.gray.opacity(0.5))
//            )
//
//            Button {
//              print("Revenge")
//            } label: {
//              Text("Revenge")
//                .font(.subheadline)
//                .fontWeight(.bold)
//              Image(systemName: "chevron.right")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 10, height: 10)
//            }
//            .padding(.horizontal, 4)
//            .foregroundColor(.white)
//            .frame(width: 100, height: 25)
//            .background(
//              RoundedRectangle(cornerRadius: 10)
//                .fill(.gray.opacity(0.5))
//            )
//
//            Button {
//              print("Racing")
//            } label: {
//              Text("Racing")
//                .font(.subheadline)
//                .fontWeight(.bold)
//              Image(systemName: "chevron.right")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 10, height: 10)
//            }
//            .padding(.horizontal, 4)
//            .foregroundColor(.white)
//            .frame(width: 100, height: 25)
//            .background(
//              RoundedRectangle(cornerRadius: 10)
//                .fill(.gray.opacity(0.5))
//            )
//
//            Button {
//              print("Family")
//            } label: {
//              Text("Family")
//                .font(.subheadline)
//                .fontWeight(.bold)
//              Image(systemName: "chevron.right")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 10, height: 10)
//            }
//            .padding(.horizontal, 4)
//            .foregroundColor(.white)
//            .frame(width: 100, height: 25)
//            .background(
//              RoundedRectangle(cornerRadius: 10)
//                .fill(.gray.opacity(0.5))
//            )
//
//            Button {
//              print("Cars")
//            } label: {
//              Text("Cars")
//                .font(.subheadline)
//                .fontWeight(.bold)
//              Image(systemName: "chevron.right")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 10, height: 10)
//            }
//            .padding(.horizontal, 4)
//            .foregroundColor(.white)
//            .frame(width: 80, height: 25)
//            .background(
//              RoundedRectangle(cornerRadius: 10)
//                .fill(.gray.opacity(0.5))
//            )
//          }
//        }
//        .padding()
//
//        // MARK: - Cast
//        VStack {
//          HStack {
//            Text("Cast")
//              .font(.system(size: 18, weight: .bold))
//            Text("See all")
//              .font(.system(size: 18, weight: .medium))
//              .foregroundColor(Color(.systemMint).opacity(0.5))
//
//            Spacer()
//          }
//          .padding(.top, 10)
//          ScrollView(.horizontal, showsIndicators: false) {
//
//            HStack(spacing: 20) {
//              VStack {
//                Image("jason")
//                  .resizable()
//                  .scaledToFill()
//                  .frame(width: 60, height: 80)
//                  .cornerRadius(10)
//
//                Text("Jason Statham")
//                  .font(.system(size: 12, weight: .medium))
//                Text("Shaw")
//                  .font(.system(size: 10, weight: .light))
//                  .foregroundColor(.gray)
//              }
//
//              VStack {
//                Image("charlize")
//                  .resizable()
//                  .scaledToFill()
//                  .frame(width: 60, height: 80)
//                  .cornerRadius(10)
//
//                Text("Charlize Theron")
//                  .font(.system(size: 12, weight: .medium))
//                Text("Ciper")
//                  .font(.system(size: 10, weight: .light))
//                  .foregroundColor(.gray)
//              }
//
//              VStack {
//                Image("tyrese")
//                  .resizable()
//                  .scaledToFill()
//                  .frame(width: 60, height: 80)
//                  .cornerRadius(10)
//
//                Text("Tyrese Gibson")
//                  .font(.system(size: 12, weight: .medium))
//                Text("Roman")
//                  .font(.system(size: 10, weight: .light))
//                  .foregroundColor(.gray)
//              }
//              VStack {
//                Image("ludacris")
//                  .resizable()
//                  .scaledToFill()
//                  .frame(width: 60, height: 80)
//                  .cornerRadius(10)
//
//                Text("Ludacris")
//                  .font(.system(size: 12, weight: .medium))
//                Text("Tej")
//                  .font(.system(size: 10, weight: .light))
//                  .foregroundColor(.gray)
//              }
//
//            }
//          }
//        }
//        .padding(.horizontal, 16)
////          .onTapGesture {
////            viewStore.send(.onTapCastList)
////          }
//
//        Divider()
//
//        HStack {
//          Text("Director: ")
//            .font(.system(size: 16, weight: .medium))
//          Text("Louis Leterrier")
//            .font(.system(size: 14, weight: .light))
//            .foregroundColor(.gray)
//
//          Spacer()
//        }
//        .padding(.horizontal, 16)
//        .padding(.bottom, 10)
//        .onTapGesture {
//          viewStore.send(.onTapDirector)
//        }
//
//      } // 아래 그룹
//      .background(Color(.gray).opacity(0.2))
//
//
//
//    } // 전체 vstack
//    .padding(.horizontal, 16)
//
//  } // Scrollview
//  .navigationTitle(state.movieItemID)
//  // large title 설정이 안먹힘
//  .navigationBarTitleDisplayMode(.large)
//  .toolbar {
//    ToolbarItem(placement: .navigationBarTrailing) {
//      Button(action: { print("tapped")}) {
//        Image(systemName:"text.badge.plus")
//
//      }
//    }
//  }
//}


//@State private var isOverviewTapped = false


//{
//  ForEach(state.itemList) { item in
//    //        if let selecedItem = state.itemList.first(where: { $0.movieItemId == state.movieItemID}) {
//    HStack(spacing: 10) {
//      Image(uiImage: item.profileImage ?? UIImage())
//        .resizable()
//        .aspectRatio(contentMode: .fill)
//        .frame(width: 60, height: 80)
//        .cornerRadius(10)
//      
//      VStack(alignment: .leading, spacing: 8) {
//        Spacer()
//        Text(item.name)
//          .font(.system(size: 18, weight: .bold))
//        Text(item.character)
//          .font(.system(size: 14, weight: .medium))
//          .foregroundColor(.gray)
//        
//        Spacer()
//      }
//    }.frame(height: 120)
//    
//    //        Text(item.id)
//    //        Text(item.name)
//  }
//}


////
///
///
///
///
//import Foundation
//import SwiftUI
//
//// movies의 데이터와 같은데 여기서는 위시리스트랑 씬리스트로 나누어서 구분 하는 것뿐 -> 보이는 UI와 눌렀을때 보이는 것은 같음 => 어떻게 구조를 짜야되나... => 일단 각자 구성하고 나중에 재사용되는 부분 정리해서 표현해보기
//struct MyListsListPage {
//  @ObservedObject var viewStore: MyListsListStore
//}
//
//extension MyListsListPage {
//  var state: MyListsListStore.State {
//    viewStore.state
//  }
//
//  private var isShowSheet: Binding<Bool> {
//    .init(
//      get: { state.isShowSheet },
//      set: { viewStore.send(.onChangeSheet($0)) })
//  }
//}
//
//extension MyListsListPage: View {
//  var body: some View {
//    ScrollView {
//      VStack(alignment: .leading) {
//        VStack(alignment: .leading) {
//          Text("CUSTOM LISTS")
//            .font(.system(size: 14, weight: .medium))
//            .foregroundColor(.gray)
//            .padding(.horizontal, 10)
//          if !state.isShowSheet {
//            Button(action: { viewStore.send( .onChangeSheet(true)) }) {
//              Text("Create Custom list")
//                .font(.system(size: 18, weight: .medium))
//                .frame(maxWidth: .infinity, alignment: .leading)
//                .frame(height: 40)
//                .padding(.horizontal)
//                .background(Color.gray.opacity(0.3))
//                .foregroundColor(Color(.systemMint).opacity(0.5))
//            }
//          }
//        }
//        .padding(.bottom, 20)
//
//
//        ZStack {
//          Color.gray.opacity(0.3)
//            .frame(height: 40)
//
//          HStack(spacing: 0) {
//            Button {
//              viewStore.send(.loadWishItemList)
//            } label: {
//              Text("Wishlist")
//            }
//            .frame(width: 150, height: 30)
//            //        .clipShape(Capsule())
//            .background(state.showType == .wishList ? Color.gray.opacity(0.7) : Color.gray.opacity(0.3))
//            .foregroundColor(.white)
//            .cornerRadius(10)
//
//            Button {
//              viewStore.send(.loadSeenItemList)
//            } label: {
//              Text("Seenlist")
//            }
//            .frame(width: 150, height: 30)
//            .background(state.showType == .seenList ? Color.gray.opacity(0.7) : Color.gray.opacity(0.3))
//            .foregroundColor(.white)
//            .cornerRadius(10)
//          }
//
//        } // ZStack
//        .padding(.bottom, 20)
//
//        // => wishlist를 누르면 wishlistpage가 나오고
//
//        VStack(alignment: .leading) {
//          if state.showType == .wishList {
//            Text("\(state.wishItemList.count) MOVES IN WISHLIST (BY RELEASE DATE)")
//              .font(.system(size: 14, weight: .medium))
//              .foregroundColor(.gray)
//              .padding(.horizontal, 10)
//
//            ScrollView {
//              VStack {
//                ForEach(state.wishItemList, id: \.title) { item in
//                  HStack {
//                    Image(uiImage: item.imageURL ?? UIImage())
//
//                      .resizable()
//                      .aspectRatio(contentMode: .fill)
//                      .frame(width: 100, height: 160)
//                      .clipShape(RoundedRectangle(cornerRadius: 10))
//
//                    VStack(alignment: .leading, spacing: 16) {
//                      Spacer()
//                      Text(item.title)
//                        .font(.system(size: 18, weight: .medium))
//                        .foregroundColor(.yellow)
//
//                      HStack(spacing: 5) {
//                        Image(systemName: "star.fill")
//                          .resizable()
//                          .aspectRatio(contentMode: .fit)
//                          .frame(width: 16, height: 16)
//                          .foregroundColor(Color(.systemRed))
//
//                        Text(String(format: "%.1f", item.rate))
//
//                        Text(item.date)
//                      }
//                      .font(.system(size: 16, weight: .medium))
//
//                      Text(item.summary)
//                        .font(.system(size: 16, weight: .medium))
//                        .foregroundColor(.gray)
//
//                      Spacer()
//                    }
//
//                    Spacer()
//                  }
//                }
//                .frame(height: 180)
//              }
//            }
//          } else if state.showType == .seenList  {
//            Text("\(state.seenItemList.count) MOVES IN WISHLIST (BY RELEASE DATE)")
//              .font(.system(size: 14, weight: .medium))
//              .foregroundColor(.gray)
//              .padding(.horizontal, 10)
//
//            ScrollView {
//              VStack {
//                ForEach(state.seenItemList, id: \.title) { item in
//                  HStack {
//                    Image(uiImage: item.imageURL ?? UIImage())
//
//                      .resizable()
//                      .aspectRatio(contentMode: .fill)
//                      .frame(width: 100, height: 160)
//                      .clipShape(RoundedRectangle(cornerRadius: 10))
//
//                    VStack(alignment: .leading, spacing: 16) {
//                      Spacer()
//                      Text(item.title)
//                        .font(.system(size: 18, weight: .medium))
//                        .foregroundColor(.yellow)
//
//                      HStack(spacing: 5) {
//                        Image(systemName: "star.fill")
//                          .resizable()
//                          .aspectRatio(contentMode: .fit)
//                          .frame(width: 16, height: 16)
//                          .foregroundColor(Color(.systemRed))
//
//                        Text(String(format: "%.1f", item.rate))
//
//                        Text(item.date)
//                      }
//                      .font(.system(size: 16, weight: .medium))
//
//                      Text(item.summary)
//                        .font(.system(size: 16, weight: .medium))
//                        .foregroundColor(.gray)
//
//                      Spacer()
//                    }
//
//                    Spacer()
//                  }
//                }
//                .frame(height: 180)
//              }
//
//            }
//          }
//        } // wishlist, seenlist
//        .onTapGesture {
//          viewStore.send(.onShowMovieDetail)
//        }
//
//      } // 전체 vstack
//    } // 전체 scrollView
//
//    .sheet(isPresented: isShowSheet) {
//      CustomListsPage()
//    }
//
//    .navigationTitle("My Lists")
//    .toolbar {
//      ToolbarItem(placement: .navigationBarTrailing) {
//        Button(action: { print("Setting")}) {
//          Image(systemName:"line.3.horizontal.decrease.circle")
//
//        }
//      }
//    }
//    .onAppear {
//      viewStore.send(.loadWishItemList)
//    }
//  }
//}
//


//      case .loadWishItemList:
//            if newState.showType != .wishList {
//              newState.wishItemList = await effector.wishItemList()
//              newState.showType = .wishList
//            }
//            return newState
//
//          case .loadSeenItemList:
//            if newState.showType != .seenList {
//              newState.seenItemList = await effector.seenItemList()
//              newState.showType = .seenList
//            }
//            return newState
        
//      case .onChangeShowType(let type):
//        print("type", type)
//        if newState.showType != type {
//          newState.showType = type
//        }
//        return newState
