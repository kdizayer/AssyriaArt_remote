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
            Scribeintro() // Scribe welcome page linked
        } else {
            ZStack {
                Image("doodle")
                    .resizable()
                    .scaledToFit()
                    
                Image("icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    //.offset(x: 0, y: -150)
                    .overlay(
                            Rectangle()
                                .stroke(Color.white, lineWidth: 2)
                                .shadow(color: .gray, radius: 2, x: 0, y: 0)
                        )
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .offset(x: 0, y: -250)
                VStack(spacing: 20) {
                                    // Add your welcoming text here
                                    Text("Welcome to Assyria Art!")
                                        .font(.title)
                                        .foregroundColor(.blue) // Adjust the color to fit your design
                                        .offset(y: showTabView ? 0 : UIScreen.main.bounds.height)
                                    
                                    // "Get Started" button
                                    Button("Get Started") {
                                        withAnimation(.easeInOut(duration: 1)) {
                                            showTabView = true
                                        }
                                    }
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .clipShape(Capsule()) // Using Capsule shape for a more standard button appearance
                                    // Removed the exaggerated frame size, padding will define the button size
                                    .offset(x: 0, y: 60) // Adjust the offset as needed
                                    .offset(y: showTabView ? 0 : UIScreen.main.bounds.height)
                                }
                            }
                            .edgesIgnoringSafeArea(.all) // Optional: Make the background extend to the edges
                        }
                    }
                }
                /*VStack(spacing: 20){
                    
                    Button("Get Started") {
                        withAnimation(.easeInOut(duration: 1)){
                            showTabView = true}
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Rectangle())
                    .frame(width: 9000, height: 9000) // button size
                    .offset(x: 0, y: 60)
                }
            }
        }
    }
} */
struct rootpreview: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
