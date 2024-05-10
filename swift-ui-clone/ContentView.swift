//
//  ContentView.swift
//  swift-ui-clone
//
//  Created by Priyam Soni on 09/05/24.
//

import SwiftUI
import SwiftfulRouting
import SwiftfulUI

struct ContentView: View {
    
    @State private var users: [User] = []
    @State private var products: [Product] = []
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(users) { user in
                    Text("\(user.firstName)")
                }
            }
            .padding()
            .task{
                await getData()
            }
        }
    }
    
    private func getData() async {
        do {
            users = try await DatabaseHelper().getUsers()
            products = try await DatabaseHelper().getProducts()
        } catch  {
            
        }
    }
}

#Preview {
    ContentView()
}
