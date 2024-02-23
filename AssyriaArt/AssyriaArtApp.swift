//
//  AssyriaArtApp.swift
//  AssyriaArt
//
//  Created by Kayla Dizayer on 2/17/24.
//

import SwiftUI

@main
struct AssyriaArtApp: App {
    init() {
            // Set tab bar background color
            UITabBar.appearance().backgroundColor = UIColor.white
            
            // Optional: Set the unselected item color if needed
            UITabBar.appearance().unselectedItemTintColor = UIColor.gray
            
            // Optional: Set the tab bar item selected color
            UITabBar.appearance().tintColor = UIColor.blue
        }
    var body: some Scene {
        WindowGroup {
           // ContentView()
            RootView()
        }
    }
}
