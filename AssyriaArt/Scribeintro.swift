//
//  Scribeintro.swift
//  AssyriaArt
//
//  Created by Kayla Dizayer on 2/21/24.
//

import Foundation
import SwiftUI

struct Scribeintro: View {
    @State private var textContent: String = "Shlama! My name is Sargon and I'm an ancient Assyrian scribe, one of the keepers of knowledge and stories from a time long, long ago."
    let textOptions: [String] = [
        "Shlama! My name is Sargon and I'm an ancient Assyrian scribe, one of the keepers of knowledge and stories from a time long, long ago.",
        "My job was super important—I wrote down everything from royal orders to tales of gods and heroes, using a writing system called cuneiform on clay tablets.",
        "But today, I have a special task for you! I need your help to bring the vibrant world of Assyria back to life with colors.",
        "You'll find pages featuring the Lamassu, ziggurat, Hanging Gardens of Babylon, and the Ishtar Gate. Each tells a story of our rich civilization, architecture, and myths.",
        "As you color, you're not just having fun… you're also stepping into the shoes of an Assyrian, creating your own version of our ancient wonders.",
        "Imagine you're painting the walls of a palace or designing a royal garden. What colors will you choose? How will you capture the spirit of Assyria?",
        "Ready to start your adventure? Grab your colors, and let's make history beautiful together!"
    ]
    @State private var currentIndex: Int = 0
    @State private var navigateToTabView: Bool = false
    @State private var displayedText = ""
    @State private var nextCharIndex = 0
    @State private var timer: Timer? = nil

    var body: some View {
        
            
            ZStack {
                
                Color(red: 0.4627, green: 0.8392, blue: 1.0)
                    
                
                HStack {
                    Image("scribe")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 600, height: 600)
                        .padding(EdgeInsets(top: 300, leading: -210, bottom: 100, trailing: -450))
                    
                    ZStack {
                        
                        Image("bubble")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 500, height: 500)
                            .padding(EdgeInsets(top: 100, leading: -100, bottom: 200, trailing: -100))
                        
                        Text(displayedText)
                            .font(.system(size: 18))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .frame(width: 200)
                            .padding(EdgeInsets(top: 0, leading: 5, bottom: 1, trailing: 5))
                            .offset(x: 0, y: -150)
                    }
                    
                }
                
                if currentIndex < textOptions.count - 1 {
                    Button("Next") {
                        withAnimation(.easeInOut(duration: 1)){
                            currentIndex += 1
                            //textContent = textOptions[currentIndex]
                            resetTypingEffect(text: textOptions[currentIndex])
                        }}
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                } else {
                    Button("Get Started") {
                        withAnimation(.easeInOut(duration: 1)){
                            navigateToTabView = true
                        }}
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
            .fullScreenCover(isPresented: $navigateToTabView) {
                MainTabView()
            }
            .onAppear {
                resetTypingEffect(text: textOptions.first ?? "")
            }
        }
            
        
    private func startTypingEffect(text: String) {
            displayedText = ""
            nextCharIndex = 0
            timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
                if nextCharIndex < text.count {
                    let index = text.index(text.startIndex, offsetBy: nextCharIndex)
                    displayedText.append(text[index])
                    nextCharIndex += 1
                } else {
                    timer?.invalidate()
                }
            }
        }
        
        private func resetTypingEffect(text: String) {
            displayedText = ""
            timer?.invalidate()
            startTypingEffect(text: text)
        }
    }


// Preview for ScribeIntroView
struct ScribeIntroView_Previews: PreviewProvider {
    static var previews: some View {
        Scribeintro()
    }
}
