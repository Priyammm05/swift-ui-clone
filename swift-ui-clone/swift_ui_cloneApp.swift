//
//  swift_ui_cloneApp.swift
//  swift-ui-clone
//
//  Created by Priyam Soni on 09/05/24.
//

import SwiftUI
import SwiftfulRouting

@main
struct swift_ui_cloneApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView{ _ in
                ContentView()
            }
        }
    }
}
