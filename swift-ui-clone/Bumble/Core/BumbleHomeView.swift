//
//  BumbleHomeView.swift
//  swift-ui-clone
//
//  Created by Priyam Soni on 13/05/24.
//

import SwiftUI

struct BumbleHomeView: View {
    
    @AppStorage("bumble_home_filter") private var selectionFilter = "Everyone"
    var options: [String] = ["Everyone", "Trending"]
    
    var body: some View {
        ZStack{
            Color.bumbleWhite.ignoresSafeArea()
            
            VStack(spacing: 12){
                header
                
                BumbleFilterComponent(options: options, selection: $selectionFilter)
                    .background(Divider(), alignment: .bottom)
                
                BumbleCardView()
                
                Spacer()
            }
            .padding(8)
        }
    }
}

#Preview {
    BumbleHomeView()
}

extension BumbleHomeView{
    private var header: some View{
        HStack(spacing: 0){
            HStack(spacing: 0){
                Image(systemName: "line.horizontal.3")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
                
                Image(systemName: "arrow.uturn.left")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        
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
}
