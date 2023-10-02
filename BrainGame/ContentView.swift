//
//  ContentView.swift
//  BrainGame
//
//  Created by Ivan Tilev on 2.10.23.
//

import SwiftUI

struct ContentView: View {
    
    var possibleMoves = ["Rock", "Paper", "Scissors"]
    
    @State private var score = 0
    
    @State private var currentState = ""
    @State private var shouldWin = Bool.random()
    
    var body: some View {
        ZStack {
            Color.init(red: 0.1, green: 0.2, blue: 0.2)
            VStack(spacing: 20) {
                Text("Player score is: \(score)")
                    .font(.title)
                    .bold()
                    .padding()
                    .foregroundColor(.white)
                Text("Computer move is: \(possibleMoves[Int.random(in: 0..<possibleMoves.count)])")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                if shouldWin {
                    Text("You have to WIN")
                        .foregroundColor(.green)
                        .font(.title2)
                        .bold()
                } else {
                    Text("You have to LOSE")
                        .foregroundColor(.red)
                        .font(.title2)
                        .bold()
                }
                HStack {
                    Button("👊") {
                        // Code here
                    }
                    .font(.system(size: 100))
                    .background(.quaternary)
                    Button("🤚") {
                        // Code here
                    }
                    .font(.system(size: 100))
                    .background(.quaternary)
                    Button("✌️") {
                        // Code here
                    }
                    .font(.system(size: 100))
                    .background(.quaternary)
                }
            }
            .padding(20)
            .background(.ultraThinMaterial)
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
