//
//  PlaylistDescriptionCell.swift
//  swift-ui-clone
//
//  Created by Priyam Soni on 12/05/24.
//

import SwiftUI

struct PlaylistDescriptionCell: View {
    
    var descriptionText: String = Product.mock.description
    var userName: String = "Priyam"
    var subHeadline: String = "Some headline"
    var onAddToPlaylistPressed: (() -> Void)? = nil
    var onDownloadPressed: (() -> Void)? = nil
    var onSharePressed: (() -> Void)? = nil
    var onEllipsisPressed: (() -> Void)? = nil
    var onAShufflePressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Text(descriptionText)
                .foregroundStyle(.spotifyLightGray)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
            madeForYouSection
            
            Text(subHeadline)
            
            buttomsRow
            
        }
        .font(.callout)
        .fontWeight(.medium)
        .foregroundStyle(.spotifyLightGray)
    }
}

#Preview {
    ZStack {
        
        Color.black.ignoresSafeArea()
        
        PlaylistDescriptionCell()
    }
}

extension PlaylistDescriptionCell{
    
    private var madeForYouSection: some View{
        HStack(spacing: 8){
            Image(systemName: "applelogo")
                .font(.title3)
                .foregroundStyle(.spotifyGreen)
            
            Text("Made for ")
            +
            Text("\(userName)")
                .bold()
                .foregroundStyle(.spotifyWhite)
        }
    }
    
    private var buttomsRow: some View{
        HStack(spacing: 0){
            HStack(spacing: 0){
                Image(systemName: "plus.circle")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .font(.title2)
                    .onTapGesture {
                        
                    }
                
                Image(systemName: "arrow.down.circle")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .font(.title2)
                    .onTapGesture {
                        
                    }
                
                Image(systemName: "square.and.arrow.up")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .font(.title2)
                    .onTapGesture {
                        
                    }
                
                Image(systemName: "ellipsis")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .font(.title2)
                    .onTapGesture {
                        
                    }
            }
            .offset(x: -8)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
            HStack(spacing: 8){
                Image(systemName: "shuffle")
                    .font(.system(size: 24))
                    .foregroundStyle(.spotifyGreen)
                    .background(Color.black.opacity(0.001))
                    .font(.title2)
                    .onTapGesture {
                        
                    }
                
                Image(systemName: "play.circle.fill")
                    .font(.system(size: 40))
                    .foregroundStyle(.spotifyGreen)
                    .background(Color.black.opacity(0.001))
                    .font(.title2)
                    .onTapGesture {
                        
                    }
            }
        }
    }
}
