//
//  NewTabView.swift
//  AssyriaArt
//
//  Created by Kayla Dizayer on 2/17/24.
//

import Foundation
import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            DrawingView(backgroundImageName: "lam")
                .tabItem {
                    Label("Lamassu", systemImage: "paintbrush.pointed.fill")
                }

            DrawingView(backgroundImageName: "ig")
                .tabItem {
                    Label("Ishtar Gates", systemImage: "paintbrush.pointed.fill")
                }

            DrawingView(backgroundImageName: "zig")
                .tabItem {
                    Label("Ziggurat", systemImage: "paintbrush.pointed.fill")
                }

            DrawingView(backgroundImageName: "hg")
                .tabItem {
                    Label("Hanging Gardens", systemImage: "paintbrush.pointed.fill")
                }

            
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
