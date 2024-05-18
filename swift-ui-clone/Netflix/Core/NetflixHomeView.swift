//
//  NetflixHomeView.swift
//  swift-ui-clone
//
//  Created by Priyam Soni on 18/05/24.
//

import SwiftUI

struct NetflixHomeView: View {
    
    @State private var filters = FilterModel.mockArray
    @State private var selectedFilter: FilterModel? = nil
    
    var body: some View {
        ZStack{
            Color.netflixBlack.ignoresSafeArea()
            
            VStack(spacing: 0){
                header
                    .padding(.horizontal, 16)
                
                NetflixFilterBarComponent(
                    filters: filters,
                    selectedFilter: selectedFilter,
                    onFilterPressed: { newFilter in
                        selectedFilter = newFilter
                    },
                    onXmarkPressed: {
                        selectedFilter = nil
                    }
                )
                .padding(.top, 16)
                
                Spacer()
                
            }
        }
        .foregroundStyle(.netflixWhite)
    }
    
    private var header: some View{
        HStack(spacing: 0){
            Text("For Priyam")
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            HStack(spacing: 16){
                Image(systemName: "tv.badge.wifi")
                    .onTapGesture {
                        
                    }
                
                Image(systemName: "magnifyingglass")
                    .onTapGesture {
                        
                    }
            }
            .font(.title2)
        }
    }
}

#Preview {
    NetflixHomeView()
}
