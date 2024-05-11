//
//  SpotifyNewReleasedCell.swift
//  swift-ui-clone
//
//  Created by Priyam Soni on 11/05/24.
//

import SwiftUI

struct SpotifyNewReleasedCell: View {
    
    var imageName: String = Constants.randomImage
    var headline: String? = "New release today"
    var subHeadline: String? = "Some Artist"
    var title: String? = "Some Playlist"
    var subTitle: String? = "Single - title"
    var onAddToPlayListPressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    
    var body: some View {
        VStack(spacing: 16){
            HStack(spacing: 8){
                ImageLoaderView(urlString: imageName)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 2){
                    if let headline{
                        Text(headline)
                            .foregroundStyle(.spotifyLightGray)
                            .font(.callout)
                    }
                    
                    if let subHeadline{
                        Text(subHeadline)
                            .foregroundStyle(.spotifyWhite)
                            .font(.title2)
                            .fontWeight(.medium)
                    }

                }
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
            HStack{
                ImageLoaderView(urlString: imageName)
                    .frame(width: 140, height: 140)
                
                VStack(alignment: .leading, spacing: 35) {
                    VStack(alignment: .leading, spacing: 2){
                        if let title{
                            Text(title)
                                .fontWeight(.semibold)
                                .foregroundStyle(.spotifyWhite)
                                .font(.callout)
                        }
                        
                        if let subTitle{
                            Text(subTitle)
                                .foregroundStyle(.spotifyLightGray)
                                .font(.callout)
                        }
                    }
                    
                    HStack(spacing: 0){
                        Image(systemName: "plus.circle")
                            .foregroundStyle(.spotifyLightGray)
                            .font(.title3)
                            .padding(4)
                            .background(Color.black.opacity(0.0001))
                            .onTapGesture {
                                onAddToPlayListPressed?()
                            }
                            .offset(x: -4)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        
                        Image(systemName: "play.circle.fill")
                            .foregroundStyle(.spotifyWhite)
                            .font(.title)
                            .onTapGesture {
                                onPlayPressed?()
                            }
                    }
                }
                .padding(.trailing, 16)
            }
            .themeColors(isSelected: false)
            .cornerRadius(8)
        }
    }
}

#Preview {
    ZStack {
        
        Color.black.ignoresSafeArea()
        
        SpotifyNewReleasedCell()
            .padding()
    }
}
