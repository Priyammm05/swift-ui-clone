//
//  ImageTitleCell.swift
//  swift-ui-clone
//
//  Created by Priyam Soni on 11/05/24.
//

import SwiftUI

struct ImageTitleCell: View {
    var imageName: String = Constants.randomImage
    var imageSize: CGFloat = 100
    var title: String = "Some title"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSize, height: imageSize)
            
            Text(title)
                .font(.callout)
                .foregroundStyle(.spotifyLightGray)
                .lineLimit(2)
                .padding(4)
        }
        .frame(width: imageSize)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        ImageTitleCell()
    }
}
