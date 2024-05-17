//
//  BumbleChatPreview.swift
//  swift-ui-clone
//
//  Created by Priyam Soni on 17/05/24.
//

import SwiftUI

struct BumbleChatPreview: View {
    
    var imageName: String = Constants.randomImage
    var percentageRemaining: Double = Double.random(in: 0...1)
    var hasNewMessage: Bool = true
    var userName: String = "Priyam"
    var lastChatMessage: String? = "This is the last mess asdf asdf asdf asdf asdf asdf asdf asdasdf asdf asdf asdf asdf asdf asdf asdf age."
    var isYourMove: Bool = true
    
    var body: some View {
        HStack(spacing: 16) {
            BumbleProfileImageComponent(
                imageName: imageName,
                percentageRemaining: percentageRemaining,
                hasNewMessage: hasNewMessage
            )
            
            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 0) {
                    Text(userName)
                        .font(.headline)
                        .foregroundStyle(.bumbleBlack)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    if isYourMove {
                        Text("YOUR MOVE")
                            .font(.caption2)
                            .bold()
                            .padding(.vertical, 4)
                            .padding(.horizontal, 6)
                            .background(.bumbleYellow)
                            .cornerRadius(32)
                    }
                }
                
                if let lastChatMessage {
                    Text(lastChatMessage)
                        .font(.subheadline)
                        .foregroundStyle(.bumbleGray)
                        .padding(.trailing, 16)
                }
            }
            .lineLimit(1)
        }
    }
}

#Preview {
    BumbleChatPreview()
        .padding()
}
