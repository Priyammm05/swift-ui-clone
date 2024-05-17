//
//  BumbleProfileImageComponent.swift
//  swift-ui-clone
//
//  Created by Priyam Soni on 17/05/24.
//

import SwiftUI

struct BumbleProfileImageComponent: View {
    var imageName: String = Constants.randomImage
    var percentageRemaining: Double = Double.random(in: 0...1)
    var hasNewMessage: Bool = true
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(.bumbleGray, lineWidth: 2)
            
            Circle()
                .trim(from: 0, to: percentageRemaining)
                .stroke(.bumbleYellow, lineWidth: 4)
                .rotationEffect(Angle(degrees: -90))
                .scaleEffect(x: -1, y: 1, anchor: .center)
            
            ImageLoaderView(urlString: imageName)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .padding(5)
        }
        .frame(width: 75, height: 75)
        .overlay (
            ZStack{
                if hasNewMessage{
                    Circle()
                        .fill(.bumbleWhite)
                    
                    Circle()
                        .fill(.bumbleYellow)
                        .padding(4)
                }
            }
            .frame(width: 24, height: 24)
            .offset(x: 2, y: 2)
            ,alignment: .bottomTrailing
        )
    }
}

#Preview {
    BumbleProfileImageComponent()
}
