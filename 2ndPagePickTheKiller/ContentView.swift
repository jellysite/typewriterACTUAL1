//
//  ContentView.swift
//  2ndPagePickTheKiller
//
//  Created by Scholar on 30/07/2024.
// correct NEW

import SwiftUI

struct ContentView: View {
    @State private var displayedText = ""
    @State private var fullText = """
    \n it was supposed to be a hearty, joyful night... \n 26 friends simply enjoying their planned dinner night \n eating delightful food, sharing smiles and laughter \n until suddenly... \n darkness engulfs the room \n screams reverberate throughout the room seconds later \n\n\n and 4 dead bodies... \n\n almost too grotesque for the human eye... \n\n seemingly cloaked in its own blood... \n\n flickers into view as the lights blink back on \n\n\n it is now down to 22 friends to catch their judas \n\n\n\n and serve justice for their dead friends
    """
    @State private var currentIndex = 0
    @State private var timer: Timer?
    @State private var isPaused = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()

                VStack {
                    Text(displayedText)
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        .padding()

                    Spacer()

                    NavigationLink(destination: Text("Destination")) {
                        Text("begin your investigation...")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color(hue: 0.054, saturation: 0.95, brightness: 0.838))
                    }
                    .padding()
                }
                .onAppear {
                    startTypewritingEffect()
                }
            }
        }
    }

    private func startTypewritingEffect() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.07, repeats: true) { _ in
            guard !isPaused else { return }

            if currentIndex < fullText.count {
                let index = fullText.index(fullText.startIndex, offsetBy: currentIndex)
                let currentChar = fullText[index]
                displayedText.append(currentChar)
                currentIndex += 1

                if currentChar == "\n" {
                    isPaused = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        isPaused = false
                    }
                }
            } else {
                timer?.invalidate()
            }
        }
    }
}

#Preview {
    ContentView()
}

