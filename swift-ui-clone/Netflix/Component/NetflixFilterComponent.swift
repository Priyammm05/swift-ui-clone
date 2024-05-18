//
//  NetflixFilterComponent.swift
//  swift-ui-clone
//
//  Created by Priyam Soni on 18/05/24.
//

import SwiftUI

struct NetflixFilterComponent: View {
    
    var title: String = "Category"
    var isSelected: Bool = false
    var isDropDown: Bool = true
    
    var body: some View {
        HStack(spacing: 4){
            Text(title)
            
            if isDropDown{
                Image(systemName: "chevron.down")
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(
            ZStack{
                
                Capsule(style: .circular)
                    .fill(.netflixDarkGray)
                    .opacity(isSelected ? 1 : 0)
                
                
                Capsule(style: .circular)
                    .stroke(lineWidth: 1)
                
            }
        )
        .foregroundStyle(.netflixLightGray)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        VStack {
            NetflixFilterComponent()
            NetflixFilterComponent(isSelected: true)
            NetflixFilterComponent(isDropDown: true)
        }
    }
}
