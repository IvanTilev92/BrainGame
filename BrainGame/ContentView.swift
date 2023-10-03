//
//  ContentView.swift
//  BrainGame
//
//  Created by Ivan Tilev on 2.10.23.
//

import SwiftUI

struct ContentView: View {
    
    let possibleMoves = ["Rock", "Paper", "Scissors"]
    let winningMoves = ["Paper", "Scissors", "Rock"]
    
    @State private var score = 0
    
    @State private var currentState = Int.random(in: 0...2)
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
                Text("Computer move is: \(possibleMoves[currentState])")
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
                    Button("🖐") {
                        buttonPressed(playerMove: 0)
                    }
                    .font(.system(size: 100))
                    .background(.quaternary)
                    Button("✌️") {
                        buttonPressed(playerMove: 1)
                    }
                    .font(.system(size: 100))
                    .background(.quaternary)
                    Button("👊") {
                        buttonPressed(playerMove: 2)
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
    
    // Main logic
    func buttonPressed(playerMove: Int) {
        if shouldWin {
            // WIN
            if currentState == playerMove {
                print("the player tapped \(winningMoves[playerMove]), the player was trying to WIN, and the app chose \(possibleMoves[currentState]), so add 1 point")
                score += 1
            } else {
                print("the player tapped \(winningMoves[playerMove]), the player was trying to WIN, BUT the app chose \(possibleMoves[currentState]), so remove 1 point")
                score -= 1
            }
        } else {
            // LOSE
            if possibleMoves[currentState] == winningMoves[playerMove] {
                print("the player tapped \(winningMoves[playerMove]), the player was trying to LOSE, BUT the app chose \(possibleMoves[currentState]), so remove 1 point")
                score -= 1
            } else {
                print("the player tapped \(winningMoves[playerMove]), the player was trying to LOSE, and the app chose \(possibleMoves[currentState]), so add 1 point")
                score += 1
            }
        }
        shouldWin.toggle()
        currentState = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
