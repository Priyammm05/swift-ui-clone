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
    
    @Environment(\.router) var router
    
    var body: some View {
        List{
            Button("Open Spotify"){
                router.showScreen(.fullScreenCover){ _ in
                    SpotifyHomeView()
                }
            }
            
            Button("Open Bumble"){
                router.showScreen(.fullScreenCover){ _ in
                    BumbleHomeView()
                }
            }
            
            Button("Open Bumble"){
                router.showScreen(.fullScreenCover){ _ in
                    NetflixHomeView()
                }
            }
        }
    }
}

#Preview {
    RouterView { _ in
        ContentView()
    }
}
