//
//  BumbleFilterComponent.swift
//  swift-ui-clone
//
//  Created by Priyam Soni on 13/05/24.
//

import SwiftUI

struct BumbleFilterComponent: View {
    var options: [String] = ["Everyone", "Trending"]
    @Binding var selection: String
    @Namespace private var namespace
    
    var body: some View {
        HStack(alignment: .top, spacing: 32) {
            ForEach(options, id: \.self){ option in
                VStack(spacing: 8){
                    Text(option)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .font(.subheadline)
                        .fontWeight(.medium)
                    
                    if(selection == option) {
                        RoundedRectangle(cornerRadius: 2)
                            .frame(height: 2)
                            .matchedGeometryEffect(id: "selection", in: namespace)
                    }
                }
                .padding(.top, 8)
                .background(Color.black.opacity(0.0001))
                .foregroundStyle(selection == option ? .bumbleBlack : .bumbleGray)
                .onTapGesture {
                    selection = option
                }
            }
        }
        .animation(.smooth, value: selection)
    }
}

fileprivate struct BumbleFilterComponentPreview: View{
    @State private var selection = "Everyone"
    var options: [String] = ["Everyone", "Trending"]
    
    var body: some View{
        BumbleFilterComponent(options: options, selection: $selection)
    }
}

#Preview {
    BumbleFilterComponentPreview()
        .padding()
}
