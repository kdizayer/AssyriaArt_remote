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
               // Color("white")
                Image("doodles")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 800, height: 900)
                    .offset(x: 110, y: 0)
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
                                    
                                    Text("Welcome to Assyria Art!")
                                        .font(.title)
                                        .bold()
                                        .foregroundColor(.black)
                                    
                                    // "Get Started" button
                                    Button("Get Started") {
                                        withAnimation(.easeInOut(duration: 1)) {
                                            showTabView = true
                                        }
                                    }
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .clipShape(Capsule())
                                    .offset(x: 0, y: 60)
                                }
                            }
                            .edgesIgnoringSafeArea(.all)
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
