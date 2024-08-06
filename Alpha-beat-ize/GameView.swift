//
//  GameView.swift
//  Alpha-beat-ize
//
//  Created by Andrew Paterson on 7/30/24.
//

import SwiftUI

struct GameView: View {
  @State private var game: GameState?
  @State private var currentWord: String = ""
  @State private var isCorrect: Bool = false
  var gameName: String
  var body: some View {
    VStack {
      Text(gameName.capitalized)
        .font(.system(size: 50))
        .foregroundStyle(.accent)
      if !(game?.gameComplete ?? false) {
        // Game not complete
        ZStack {
          RoundedRectangle(cornerRadius: 25)
            .frame(height: 350)
            .padding()
            .foregroundStyle(.accent)
          RoundedRectangle(cornerRadius: 25)
            .frame(height: 330)
            .padding([.leading, .trailing], 25)
            .foregroundStyle(.white)
          VStack {
            Text("Starting with " + (game?.currentLetter.rawValue.uppercased() ?? "?"))
              .font(.system(size: 30))
              .foregroundStyle(isCorrect ? .accent : .black)
            TextField("Enter Word Here", text: $currentWord)
              .font(.largeTitle)
              .padding()
              .autocorrectionDisabled()
              .textInputAutocapitalization(.never)
              .foregroundStyle(isCorrect ? .accent : .black)
              .multilineTextAlignment(.center)
              .onSubmit {
                if let game = game {
                  isCorrect = game.checkAnswer(answer: currentWord)
                }
              }
            if isCorrect {
              Button("Next") {
                if game != nil {
                  game!.advance()
                  currentWord = ""
                  isCorrect = false
                }
              }
              .buttonStyle(.borderedProminent)
            }
            else {
              Button("Skip") {
                if game != nil {
                  game!.advance()
                  currentWord = ""
                  isCorrect = false
                }
              }
              .buttonStyle(.borderedProminent)
            }
          }
        }
      }
      else {
        // Game complete
        VStack{
          Text("You win!")
            .font(.system(size: 50))
            .foregroundStyle(.accent)
          Button("Play again") {
            game!.gameComplete = false
            currentWord = ""
            isCorrect = false
          }
          .buttonStyle(.borderedProminent)
        }
        
      }
    }
    .task {
      let items = loadItems(gameName)
      game = GameState(currentLetter: .a, letterDictionary: items)
    }
  }
  
  func loadItems(_ name: String) -> ItemDictionary {
    let asset = NSDataAsset(name: name)
    return try! JSONDecoder().decode(ItemDictionary.self, from: asset!.data)
  }
}

#Preview {
  GameView(gameName: "fruits")
}
