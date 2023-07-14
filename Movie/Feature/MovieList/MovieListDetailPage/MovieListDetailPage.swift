import Foundation
import SwiftUI

struct MovieListDetailPage {
  @ObservedObject var viewModel: MovieListDetailPageViewModel
  @State private var wishListSelected = false
  @State private var seenListSelected = false
  @State private var isOverviewTapped = false
}

extension MovieListDetailPage {
  var state: MovieListDetailPageViewModel.State {
    viewModel.state
  }
}

extension MovieListDetailPage: View {
  var body: some View {
    ScrollView {
      VStack {
        
        // 위의 그룹
        VStack {
          Group {
            VStack(alignment: .leading, spacing: 10) {
              Spacer()
              HStack {
                Image("fastx")
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(width: 100, height: 160)
                  .clipShape(RoundedRectangle(cornerRadius: 10))
                
                VStack {
                  Spacer()
                  Text("2023 * 142 minutes * Released United State of America")
                  
                  HStack(spacing: 5) {
                    Image(systemName: "star.fill")
                      .resizable()
                      .aspectRatio(contentMode: .fit)
                      .frame(width: 16, height: 16)
                      .foregroundColor(Color(.systemRed))
                    
                    Text("3.5")
                    Text("2,614 ratings")
                    
                    Spacer()
                  }
                  .font(.system(size: 16, weight: .medium))
                  
                  Spacer()
                }
              } // 앞에랑 같은것
              
              Spacer()
              
              // 장르버튼
              HStack {
                Button {
                  print("액션")
                } label: {
                  Text("액션")
                    .font(.subheadline)
                    .fontWeight(.bold)
                  Image(systemName: "chevron.right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 10, height: 10)
                }
                .padding(.horizontal, 4)
                .foregroundColor(.white)
                .frame(width: 80, height: 25)
                .background(
                  RoundedRectangle(cornerRadius: 10)
                    .fill(.black)
                )
                
                Button {
                  print("범죄")
                } label: {
                  Text("범죄")
                    .font(.subheadline)
                    .fontWeight(.bold)
                  Image(systemName: "chevron.right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 10, height: 10)
                }
                .padding(.horizontal, 4)
                .foregroundColor(.white)
                .frame(width: 80, height: 25)
                .background(
                  RoundedRectangle(cornerRadius: 10)
                    .fill(.black)
                )
                
                Button {
                  print("스릴러")
                } label: {
                  Text("스릴러")
                    .font(.subheadline)
                    .fontWeight(.bold)
                  Image(systemName: "chevron.right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 10, height: 10)
                }
                .padding(.horizontal, 4)
                .foregroundColor(.white)
                .frame(width: 80, height: 25)
                .background(
                  RoundedRectangle(cornerRadius: 10)
                    .fill(.black)
                )
                
                Spacer()
              } // 장르 버튼
              .padding(.horizontal, 8)
              .padding(.bottom, 16)
              Spacer()
              
            } // vstack
            .padding(.horizontal, 16)
          } // group
          .frame(height: 260)
          //      .background(Color(.gray).opacity(0.2))
          .background(
            RadialGradient(
              colors: [Color.gray.opacity(0.5), Color.gray.opacity(0.3)],
              center: .center,
              startRadius: 5,
              endRadius: 200
            )
            .cornerRadius(10))
          
          // wishlist, seenlist
          HStack {
            Button(action: {
              wishListSelected.toggle()
              seenListSelected = false
            }) {
              HStack(spacing: 2) {
                if wishListSelected {
                  Image(systemName: "heart.fill")
                    .renderingMode(.template)
                    .foregroundColor(.white)
                  Text("In wishlist")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                } else {
                  Image(systemName: "heart")
                    .foregroundColor(Color(.systemRed))
                  Text("Wishlist")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(Color(.systemRed))
                }
              }
            }
            .frame(width: wishListSelected ? 120 : 100, height: 30, alignment: .center)
            .background(
              RoundedRectangle(cornerRadius: 5)
                .stroke(wishListSelected ? Color(.clear) : Color(.systemRed), lineWidth: 1)
                .background(
                  RoundedRectangle(cornerRadius: 5)
                    .fill(wishListSelected ? Color(.systemPink) : .clear)
                )
            )
            
            Button(action: {
              seenListSelected.toggle()
              wishListSelected = false
            }) {
              HStack(spacing: 2) {
                if seenListSelected {
                  Image(systemName: "eye.fill")
                    .renderingMode(.template)
                    .foregroundColor(.white)
                  Text("Seen")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                } else {
                  Image(systemName: "eye")
                    .foregroundColor(Color(.systemGreen))
                  Text("Seenlist")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(Color(.systemGreen))
                }
              }
            }
            .frame(width: seenListSelected ? 80 : 100, height: 30, alignment: .center)
            .background(
              RoundedRectangle(cornerRadius: 5)
                .stroke(seenListSelected ? Color(.clear) : Color(.systemGreen), lineWidth: 1)
                .background(
                  RoundedRectangle(cornerRadius: 5)
                    .fill(seenListSelected ? Color(.systemGreen) : .clear)
                )
            )
            
            Button(action: {
              
            }) {
              HStack(spacing: 2) {
                Image(systemName: "pin")
                Text("List")
              }
            }
            .frame(width: 60, height: 30, alignment: .center)
            .foregroundColor(Color(.systemYellow))
            .background(
              RoundedRectangle(cornerRadius: 5)
                .stroke(Color(.systemYellow), lineWidth: 1)
            )
            
            Spacer()
          }
          .padding(.horizontal, 16)
          
          Divider()
          
          HStack {
            Text("7 reviews")
              .font(.system(size: 18, weight: .medium))
              .foregroundColor(Color(.systemMint).opacity(0.5))
            
            
            Spacer()
          }
          .padding(.horizontal, 16)
          .frame(height: 50)
          // 왜 여기서 배경색을 설정하면 모든 프레임에서 되는데 배경색을 설정하지 않고 프레임 범위를 탭하면 탭 로직이 실행이 안되는 건가?
          //        .background(Color(.systemBlue).opacity(0.1))
          .onTapGesture {
            // review page
            print("tapp")
            viewModel.send(action: .onTapReviews)
          }
          
          Divider()
          
          HStack {
            VStack(alignment: .leading, spacing: 8) {
              Text("Overview:")
                .font(.system(size: 18, weight: .bold))
              
              Text(isOverviewTapped ? "돔과 그의 패밀리 앞에 나타난 운명의 적 단테, 관거의 그림자는 돔의 모든 것을 파괴하기 위해 달려온다. 단테에 의해 산산히 흩어진 패밀리들은 모두 목숨을 걸고 맞서야 하는 함점에 빠지고 마는데..." : "돔과 그의 패밀리 앞에 나타난 운명의 적 단테, 관거의 그림자는 돔의 모든 것을 파괴하기 위해 달려온다..")
                .foregroundColor(Color(.gray))
              
              Button(action: { isOverviewTapped.toggle()}) {
                Text(isOverviewTapped ? "Less" : "Read more")
                  .font(.system(size: 18, weight: .medium))
                  .foregroundColor(Color(.systemMint).opacity(0.5))
              }
            }
            Spacer()
          }
          .padding(.horizontal, 16)
          .padding(.bottom, 10)
          
        } // 위의 그룹
        .background(Color(.gray).opacity(0.2))
        .padding(.bottom, 20)
        
        // 아래 그룹
        VStack {
          
          // 키워드
          HStack {
            Text("Keywords")
              .font(.system(size: 18, weight: .bold))
              .padding()
            Spacer()
          }
          ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
              Button {
                print("Sequel")
              } label: {
                Text("Sequel")
                  .font(.subheadline)
                  .fontWeight(.bold)
                Image(systemName: "chevron.right")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 10, height: 10)
              }
              .padding(.horizontal, 4)
              .foregroundColor(.white)
              .frame(width: 100, height: 25)
              .background(
                RoundedRectangle(cornerRadius: 10)
                  .fill(.gray.opacity(0.5))
              )
              
              Button {
                print("Revenge")
              } label: {
                Text("Revenge")
                  .font(.subheadline)
                  .fontWeight(.bold)
                Image(systemName: "chevron.right")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 10, height: 10)
              }
              .padding(.horizontal, 4)
              .foregroundColor(.white)
              .frame(width: 100, height: 25)
              .background(
                RoundedRectangle(cornerRadius: 10)
                  .fill(.gray.opacity(0.5))
              )
              
              Button {
                print("Racing")
              } label: {
                Text("Racing")
                  .font(.subheadline)
                  .fontWeight(.bold)
                Image(systemName: "chevron.right")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 10, height: 10)
              }
              .padding(.horizontal, 4)
              .foregroundColor(.white)
              .frame(width: 100, height: 25)
              .background(
                RoundedRectangle(cornerRadius: 10)
                  .fill(.gray.opacity(0.5))
              )
              
              Button {
                print("Family")
              } label: {
                Text("Family")
                  .font(.subheadline)
                  .fontWeight(.bold)
                Image(systemName: "chevron.right")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 10, height: 10)
              }
              .padding(.horizontal, 4)
              .foregroundColor(.white)
              .frame(width: 100, height: 25)
              .background(
                RoundedRectangle(cornerRadius: 10)
                  .fill(.gray.opacity(0.5))
              )
              
              Button {
                print("Cars")
              } label: {
                Text("Cars")
                  .font(.subheadline)
                  .fontWeight(.bold)
                Image(systemName: "chevron.right")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 10, height: 10)
              }
              .padding(.horizontal, 4)
              .foregroundColor(.white)
              .frame(width: 80, height: 25)
              .background(
                RoundedRectangle(cornerRadius: 10)
                  .fill(.gray.opacity(0.5))
              )
            }
          }
          .padding()
          
          // MARK: - Cast
          VStack {
            HStack {
              Text("Cast")
                .font(.system(size: 18, weight: .bold))
              Text("See all")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(Color(.systemMint).opacity(0.5))
              
              Spacer()
            }
            .padding(.top, 10)
            ScrollView(.horizontal, showsIndicators: false) {
              
              HStack(spacing: 20) {
                VStack {
                  Image("jason")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 80)
                    .cornerRadius(10)
                  
                  Text("Jason Statham")
                    .font(.system(size: 12, weight: .medium))
                  Text("Shaw")
                    .font(.system(size: 10, weight: .light))
                    .foregroundColor(.gray)
                }
                
                VStack {
                  Image("charlize")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 80)
                    .cornerRadius(10)
                  
                  Text("Charlize Theron")
                    .font(.system(size: 12, weight: .medium))
                  Text("Ciper")
                    .font(.system(size: 10, weight: .light))
                    .foregroundColor(.gray)
                }
                
                VStack {
                  Image("tyrese")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 80)
                    .cornerRadius(10)
                  
                  Text("Tyrese Gibson")
                    .font(.system(size: 12, weight: .medium))
                  Text("Roman")
                    .font(.system(size: 10, weight: .light))
                    .foregroundColor(.gray)
                }
                VStack {
                  Image("ludacris")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 80)
                    .cornerRadius(10)
                  
                  Text("Ludacris")
                    .font(.system(size: 12, weight: .medium))
                  Text("Tej")
                    .font(.system(size: 10, weight: .light))
                    .foregroundColor(.gray)
                }
                
              }
            }
          }
          .padding(.horizontal, 16)
          .onTapGesture {
            viewModel.send(action: .onTapCastList)
          }
          
          Divider()
          
          HStack {
            Text("Director: ")
              .font(.system(size: 16, weight: .medium))
            Text("Louis Leterrier")
              .font(.system(size: 14, weight: .light))
              .foregroundColor(.gray)
            
            Spacer()
          }
          .padding(.horizontal, 16)
          .padding(.bottom, 10)
          .onTapGesture {
            viewModel.send(action: .onTapDirector)
          }
          
        } // 아래 그룹
        .background(Color(.gray).opacity(0.2))
        
        
        
      } // 전체 vstack
      .padding(.horizontal, 16)
      
    } // Scrollview
    .navigationTitle("분노의 질주")
    // large title 설정이 안먹힘
    .navigationBarTitleDisplayMode(.large)
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        Button(action: { print("tapped")}) {
          Image(systemName:"text.badge.plus")
          
        }
      }
    }
  }
}
