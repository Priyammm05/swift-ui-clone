//
//  NetflixDetailView.swift
//  swift-ui-clone
//
//  Created by Priyam Soni on 20/05/24.
//

import SwiftUI

struct NetflixDetailView: View {
    var product: Product = .mock
    @State private var progress: Double = 0.2
    
    var body: some View {
        ZStack{
            Color.netflixBlack.ignoresSafeArea()
            Color.netflixDarkGray.opacity(0.3).ignoresSafeArea()
            
            VStack(spacing: 0){
                NetflixDetailHeaderView(
                    imageName: product.firstImage,
                    progress: progress,
                    onAirplanePressed: {
                        
                    },
                    onXMarkPressed: {
                        
                    }
                )
                
                ScrollView(.vertical){
                    VStack(alignment: .leading, spacing: 16){
                        detailsProductSection
                    }
                    .padding(8)
                }
                .scrollIndicators(.hidden)
            }
        }
    }
    
    private var detailsProductSection: some View {
        NetflixDetailProductComponent(
            title: product.title,
            isNew: true,
            yearReleased: "2024",
            seasonCount: 4,
            hasClosedCaptions: true,
            isTopTen: 6,
            descriptionText: product.description,
            onPlayPressed: {
                
            },
            onDownloadPressed: {
                
            }
        )
    }
}

#Preview {
    NetflixDetailView()
}
