//
//  ContentView.swift
//  rock-paper-scissors Watch App
//
//  Created by Neslihan Kara on 26.08.2023.
//

import SwiftUI

enum RockPaperScissors: String, CaseIterable {
    case rock = "🪨 Rock"
    case paper = "🧻 Paper"
    case scissors = "✂️ Scissors"
    
    func beats(_ opponent: RockPaperScissors) -> Bool {
            switch self {
            case .rock:
                return opponent == .scissors
            case .paper:
                return opponent == .rock
            case .scissors:
                return opponent == .paper
            }
        }
}

struct ContentView: View {
    @State private var selectedOption: RockPaperScissors? = nil
    @State private var opponentOption: RockPaperScissors? = nil
    
    // Sample data for demonstration
    let options: [RockPaperScissors] = [.rock, .paper, .scissors]
    
    func handleTap(option: RockPaperScissors) {
        selectedOption=option
        opponentOption=options.randomElement()
    }
    
    var body: some View {
        VStack { if selectedOption != nil {
            Text("You: " + selectedOption!.rawValue.split(separator: " ")[0]).font(.title3)
            Text("Opponent: " + opponentOption!.rawValue.split(separator: " ")[0]).font(.title3)
            if (selectedOption == opponentOption) {
                Text("THAT'S A THAI 🇹🇭").padding(10)
            } else if (selectedOption!.beats(opponentOption!)) {
                Text("YOU WIN!!").padding(10)
            } else {
                Text("YOU LOSE...").padding(10)
            }
            Button(action: {
                selectedOption = nil
            }){Text("Go Back")}
            }
            
          else {
            List {
                ForEach(options, id: \.self) { option in
                    Button(action: {
                        handleTap(option: option)
                    }) {
                        Text(option.rawValue)
                    }
                }
            }
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
