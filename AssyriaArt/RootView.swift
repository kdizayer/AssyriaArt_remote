//
//  RootView.swift
//  AssyriaArt
//
//  Created by Kayla Dizayer on 2/17/24.
//

import Foundation
import SwiftUI


struct RootView: View {
    @State private var showTabView = false

    var body: some View {
        if showTabView {
            MainTabView() // Your tab view
        } else {
            ZStack {
                // Background image
                Image("flag")
                   // .resizable()
                    .edgesIgnoringSafeArea(.all) // Make sure the image fills the whole screen
                    .aspectRatio(contentMode: .fill) // Fill the screen while preserving aspect ratio

                
                VStack {
                    Text("Welcome to the Drawing App!")
                        .font(.title)
                        .padding()
                        .foregroundColor(.black) // Ensure text is visible on the background

                    Button("Start") {
                        showTabView = true
                    }
                    .padding()
                    .background(Color.yellow)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .frame(width: 5000, height: 5000) // button size
                    .offset(x: 0, y: -50)
                }
            }
        }
    }
}
