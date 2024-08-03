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
      ZStack {
        Rectangle()
          .foregroundStyle(.accent)
          .ignoresSafeArea()
        ZStack {
          Rectangle()
            .foregroundStyle(.white)
            .padding()
          if !(game?.gameComplete ?? false) {
            VStack {
              HStack {
                Text(game?.currentLetter.rawValue.uppercased(with: .autoupdatingCurrent) ?? "")
                  .font(.system(size: 50))
                  .padding(.leading, 40)
                  .foregroundStyle(isCorrect ? .accent : .black)
                TextField("Word", text: $currentWord)
                  .font(.system(size: 50))
                  .autocorrectionDisabled()
                  .textInputAutocapitalization(.never)
                  .offset(x: -10)
                  .foregroundStyle(isCorrect ? .accent : .black)
                  .disabled(isCorrect)
                  .onSubmit {
                    if let game = game {
                      isCorrect = game.checkAnswer(answer: game.currentLetter.rawValue + currentWord)
                      print(isCorrect)
                    }
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
              }
              else {
                Button("Skip") {
                  if game != nil {
                    game!.advance()
                    currentWord = ""
                    isCorrect = false
                  }
                }
              }
            }
          }
          else {
            VStack{
              Text("You win!")
                .font(.system(size: 50))
                .foregroundStyle(.accent)
              Button("Play again") {
                game!.gameComplete = false
                currentWord = ""
                isCorrect = false
              }
            }
          }
        }
      }
        .task {
          let items = loadItems(gameName)
          game = GameState(currentLetter: .a, letterDictionary: items)
          print(game!)
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
