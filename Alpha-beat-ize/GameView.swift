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
  @State private var isDisplayingHintView: Bool = false
  @State private var hints: Int = 0
  @State private var skips: Int = 0
  @State private var startTime: Date = Date()
  @State private var endTime: Date = Date()
  var gameName: String
  var title: String
  var body: some View {
    VStack {
      Text(title)
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
            .foregroundStyle(.background)
          VStack {
            Text("Starting with " + (game?.currentLetter.rawValue.uppercased() ?? "?"))
              .font(.system(size: 30))
              .foregroundStyle(isCorrect ? .accent : .primary)
            TextField("Enter Word Here", text: $currentWord)
              .font(.largeTitle)
              .padding()
              .autocorrectionDisabled()
              .textInputAutocapitalization(.never)
              .foregroundStyle(isCorrect ? .accent : .primary)
              .multilineTextAlignment(.center)
              .onSubmit {
                if let game = game {
                  isCorrect = game.checkAnswer(answer: currentWord.lowercased())
                }
              }
            if isCorrect {
              Button("Next") {
                if game != nil {
                  game!.advance()
                  if game!.gameComplete {
                    endTime = Date()
                  }
                  currentWord = ""
                  isCorrect = false
                }
              }
              .buttonStyle(.borderedProminent)
            }
            else {
              HStack {
                Button("Skip") {
                  if game != nil {
                    game!.advance()
                    if game!.gameComplete {
                      endTime = Date()
                    }
                    currentWord = ""
                    isCorrect = false
                    skips += 1
                  }
                }
                .buttonStyle(.borderedProminent)
                Button("Hint"){
                  isDisplayingHintView = true
                  hints += 1
                }
                .buttonStyle(.borderedProminent)
              }
            }
            Link("Report a Missing Word", destination: URL(string: "https://forms.office.com/r/VNDETbRHnx")!)
              .font(.system(size: 20))
              .foregroundStyle(.accent)
              .padding(.top, 10)
          }
        }
      }
      else {
        // Game complete
        VStack{
          Text("You win!")
            .font(.system(size: 50))
            .foregroundStyle(.accent)
          Text("You used \(skips) skip(s) and \(hints) hint(s)")
            .font(.system(size: 20))
            .foregroundStyle(.accent)
          Text("You took \(endTime.timeIntervalSince(startTime).rounded(), specifier: "%.0f") seconds")
            .font(.system(size: 20))
            .foregroundStyle(.accent)
          Button("Play again") {
            game!.gameComplete = false
            currentWord = ""
            isCorrect = false
            skips = 0
            hints = 0
            startTime = Date()
          }
          .buttonStyle(.borderedProminent)
        }
        
      }
    }
    .task {
      let items = loadItems(gameName)
      game = GameState(currentLetter: .a, letterDictionary: items)
    }
    .sheet(isPresented: $isDisplayingHintView, content: {
      HintView(answer: game?.currentPossibleAnswers.randomElement() ?? "")
        .presentationDetents([.medium])
    })
    
  }
  
  func loadItems(_ name: String) -> ItemDictionary {
    let asset = NSDataAsset(name: name)
    return try! JSONDecoder().decode(ItemDictionary.self, from: asset!.data)
  }
}

#Preview {
  GameView(gameName: "fruits", title: "Fruits")
}
