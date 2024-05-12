//
//  SpotifyHomeView.swift
//  swift-ui-clone
//
//  Created by Priyam Soni on 10/05/24.
//

import SwiftUI
import SwiftfulUI

struct SpotifyHomeView: View {
    
    @State private var currentUser: User? = nil
    @State private var selectedCategory: Category? = nil
    @State private var products: [Product] = []
    @State private var productRows: [ProductRow] = []
    
    var body: some View {
        ZStack{
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView(.vertical){
                LazyVStack(spacing: 1, pinnedViews: [.sectionHeaders], content: {
                    Section{
                        
                        VStack(spacing: 16){
                            spotifyRecents
                                .padding(.horizontal, 16)
                            
                            if let product = products.first{
                                newReleaseSection(product: product)
                                    .padding(.horizontal, 16)
                            }
                            
                            listRows
                        }
                        
                    } header: {
                        spotifyHeader
                    }
                })
                .padding(.top, 8)
            }
            .scrollIndicators(.hidden)
            .clipped()
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func getData() async {
        do {
            currentUser = try await DatabaseHelper().getUsers().first
            products = try await Array(DatabaseHelper().getProducts().prefix(8))
            
            var rows: [ProductRow] = []
            let allBrands = Set(products.map({ $0.brand }))
            for brand in allBrands {
//                let products = self.products.filter({ $0.brand == brand })
                rows.append(ProductRow(title: brand.capitalized, products: products))
            }
            
            productRows = rows
            
        } catch  {
            
        }
    }
}

#Preview {
    SpotifyHomeView()
}

extension SpotifyHomeView{
    private var spotifyHeader: some View{
        HStack{
            ZStack{
                if let currentUser {
                    ImageLoaderView(urlString: currentUser.image)
                        .background(.spotifyWhite)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .onTapGesture {
                            
                        }
                }
            }
            .frame(width: 35, height: 35)
            
            ScrollView(.horizontal) {
                HStack(spacing: 8){
                    ForEach(Category.allCases, id: \.self){ category in
                        SpotifyCategoryCell(
                            title: category.rawValue.capitalized,
                            isSelected: category == selectedCategory
                        )
                        .onTapGesture {
                            selectedCategory = category
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .padding(.vertical, 24)
        .padding(.leading, 8)
        .frame(maxWidth: .infinity)
        .background(Color.spotifyBlack)
    }
    
    private var spotifyRecents: some View{
        NonLazyVGrid(columns : 2, alignment: .center, spacing: 10, items: products) { product in
            if let product {
                SpotifyRecentCell(
                    imageName: product.firstImage,
                    title: product.title
                )
                .asButton(.press) {
                }
            }
        }
    }
    
    private func newReleaseSection(product: Product) -> some View {
        SpotifyNewReleasedCell(
            imageName: product.firstImage,
            headline: product.brand,
            subHeadline: product.category,
            title: product.title,
            subTitle: product.description,
            onAddToPlayListPressed: {
            
            },
            onPlayPressed: {
//                goToPlaylistView(product: product)
            }
        )
    }

    private var listRows: some View {
        ForEach(productRows) { row in
            VStack(spacing: 8) {
                Text(row.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.spotifyWhite)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)

                ScrollView(.horizontal) {
                    HStack(alignment: .top, spacing: 16) {
                        ForEach(row.products) { product in
                            ImageTitleCell(
                                imageName: product.firstImage,
                                imageSize: 120,
                                title: product.title
                            )
                            .asButton(.press) {
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                }
                .scrollIndicators(.hidden)
            }
        }
    }
}
