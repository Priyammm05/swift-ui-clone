//
//  BumbleCardView.swift
//  swift-ui-clone
//
//  Created by Priyam Soni on 14/05/24.
//

import SwiftUI
import SwiftfulUI

struct BumbleCardView: View {
    var user: User = .mock
    @State private var cardFrame: CGRect = .zero
    
    var body: some View {
        ScrollView(.vertical){
            LazyVStack(spacing: 0){
                headerCell
                    .frame(height: cardFrame.height)
                
                aboutMeSection
                    .padding(.horizontal, 24)
                    .padding(.vertical, 24)
                
                myInterestsSection
                    .padding(.horizontal, 24)
                    .padding(.vertical, 24)
            }
        }
        .scrollIndicators(.hidden)
        .background(.bumbleBackground)
        .cornerRadius(32)
        .readingFrame{ frame in
            cardFrame = frame
        }
    }
}

#Preview {
    BumbleCardView()
        .padding(.horizontal, 16)
        .padding(.vertical, 40)
}

extension BumbleCardView{
    private var headerCell: some View{
        ZStack(alignment: .bottomLeading){
            ImageLoaderView(urlString: user.image)
               
            VStack(alignment: .leading, spacing: 8){
                Text("\(user.firstName), \(user.age)")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                HStack(spacing: 4) {
                    Image(systemName: "suitcase")
                    Text("\(user.work)")
                }
                
                HStack(spacing: 4) {
                    Image(systemName: "graduationcap")
                    Text("\(user.education)")
                }
                
                BumbleHeartView()
                    .onTapGesture {
                        
                    }
            }
            .padding(24)
            .font(.callout)
            .fontWeight(.medium)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                LinearGradient(
                    colors: [
                        .bumbleBlack.opacity(0),
                        .bumbleBlack.opacity(0.6),
                        .bumbleBlack.opacity(0.6),
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .foregroundStyle(.spotifyWhite)
        }
    }
    
    private func sectionTitle(title: String) -> some View {
        Text(title)
            .font(.body)
            .foregroundStyle(.bumbleGray)
    }
    
    private var aboutMeSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            sectionTitle(title: "About Me")
            
            Text(user.aboutMe)
                .font(.body)
                .fontWeight(.semibold)
                .foregroundStyle(.bumbleBlack)
            
            HStack(spacing: 0) {
                BumbleHeartView()
                
                Text("Send a Compliment")
                    .font(.caption)
                    .fontWeight(.semibold)
            }
            .padding([.horizontal, .trailing], 8)
            .background(.bumbleYellow)
            .cornerRadius(32)
            .onTapGesture {
//                onSendAComplimentPressed?()
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var myInterestsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading, spacing: 8) {
                sectionTitle(title: "My basics")
                InterestPillGridView(interests: user.basics)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                sectionTitle(title: "My interests")
                InterestPillGridView(interests: user.interests)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
