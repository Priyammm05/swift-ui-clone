//
//  BumbleHomeView.swift
//  swift-ui-clone
//
//  Created by Priyam Soni on 13/05/24.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct BumbleHomeView: View {
    
    @Environment(\.router) var router
    
    @AppStorage("bumble_home_filter") private var selectionFilter = "Everyone"
    var options: [String] = ["Everyone", "Trending"]
    @State private var allUsers: [User] = []
    @State private var selectedIndex: Int = 0
    @State private var cardOffsets: [Int: Bool] = [:]
    @State private var currentSwipeOffset: CGFloat = 0
    
    var body: some View {
        ZStack{
            Color.bumbleWhite.ignoresSafeArea()
            
            VStack(spacing: 12){
                header
                
                BumbleFilterComponent(options: options, selection: $selectionFilter)
                    .background(Divider(), alignment: .bottom)
                
                ZStack{
                    if !allUsers.isEmpty{
                        ForEach(Array(allUsers.enumerated()), id: \.offset){ (index, user) in
                            
                            let isPrevious =  (selectedIndex - 1) ==  index
                            let isCurrent =  selectedIndex ==  index
                            let isNext = (selectedIndex + 1) == index
                            
                            if isPrevious || isCurrent || isNext{
                                let offsetValue = cardOffsets[user.id]
                                
                                userProfileCell(user: user, index: index)
                                    .zIndex(Double(allUsers.count - index))
                                    .offset(x: offsetValue == nil ? 0 : offsetValue == true ? 900 : -900)
                            }
                        }
                    }
                    else{
                        ProgressView()
                    }
                    
                    overlaySwipeIndicator
                        .zIndex(99999)
                    
                }
                .frame(maxHeight: .infinity)
                .padding(4)
                .animation(.smooth, value: cardOffsets)
            }
            .padding(8)
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func getData() async{
        do {
            allUsers = try await DatabaseHelper().getUsers()
        } catch  {
            
        }
    }
    
    private func userDidSelect(index: Int, isLike: Bool){
        let user = allUsers[index]
        cardOffsets[user.id] = isLike
        
        selectedIndex += 1
    }
}

#Preview {
    RouterView { _ in
        BumbleHomeView()
    }
}

extension BumbleHomeView{
    private var header: some View{
        HStack(spacing: 0){
            HStack(spacing: 0){
                Image(systemName: "line.horizontal.3")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        router.showScreen(.push){ _ in
                            BumbleChatsView()
                        }
                    }
                
                Image(systemName: "arrow.uturn.left")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        router.dismissScreen()
                    }
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
            Text("bumble")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.bumbleYellow)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
            
            Image(systemName: "slider.horizontal.3")
                .padding(8)
                .background(Color.black.opacity(0.001))
                .onTapGesture {
                    
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
        }
        .font(.title2)
        .fontWeight(.medium)
        .foregroundStyle(.bumbleBlack)
    }
    
    private func userProfileCell(user: User, index: Int) -> some View {
        BumbleCardView(
            user: user,
            onSendAComplimentPressed: nil,
            onSuperLikePressed: nil,
            onXmarkPressed: {
                userDidSelect(index: index, isLike: false)
            },
            onCheckmarkPressed: {
                userDidSelect(index: index, isLike: true)
            },
            onHideAndReportPressed: {
                
            }
        )
        .withDragGesture(
            .horizontal,
            minimumDistance: 10,
            resets: true,
            rotationMultiplier: 1.05,
            //              scaleMultiplier: 0.8,
            onChanged: { dragOffset in
                currentSwipeOffset = dragOffset.width
            },
            onEnded: { dragOffset in
                if dragOffset.width < -160 {
                    userDidSelect(index: index, isLike: false)
                } else if dragOffset.width > 160 {
                    userDidSelect(index: index, isLike: true)
                }
            }
        )
    }
    
    private var overlaySwipeIndicator: some View{
        ZStack{
            Circle()
                .fill(.bumbleGray.opacity(0.4))
                .overlay(
                    Image(systemName: "xmark")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.semibold)
                )
                .frame(width: 60, height: 60)
                .scaleEffect(abs(currentSwipeOffset) > 100 ? 1.5 : 1.0 )
                .offset(x: min(-currentSwipeOffset, 150))
                .offset(x: -100)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Circle()
                .fill(.bumbleGray.opacity(0.4))
                .overlay(
                    Image(systemName: "checkmark")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.semibold)
                )
                .frame(width: 60, height: 60)
                .scaleEffect(abs(currentSwipeOffset) > 100 ? 1.5 : 1.0 )
                .offset(x: max(-currentSwipeOffset, -150))
                .offset(x: 100)
                .frame(maxWidth: .infinity, alignment: .trailing)

        }
        .animation(.smooth, value: currentSwipeOffset)
    }
}
