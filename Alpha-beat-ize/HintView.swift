//
//  HintView.swift
//  Alpha-beat-ize
//
//  Created by Andrew Paterson on 8/13/24.
//

import SwiftUI

struct HintView: View {
  var answer: String
  @State var hint: String = ""
    var body: some View {
        Text(hint)
        .monospaced()
        .font(.system(size: 25))
        .task {
          shuffle()
        }
        .padding()
        Button("Shuffle") {
          shuffle()
        }
        .buttonStyle(.borderedProminent)
    }
  
  func shuffle() {
    withAnimation(.snappy()) {
      if answer.contains(" ") {
        let components = answer[answer.index(after: answer.startIndex)..<answer.endIndex].components(separatedBy: " ")
        var response = String(answer[answer.startIndex])
        for component in components {
          response += String(component.shuffled()) + " "
        }
        hint = response
      }
      else {
        let restOfString = answer[answer.index(after: answer.startIndex)..<answer.endIndex]
        hint = String(answer[answer.startIndex]) + String(restOfString.shuffled())
      }
    }
  }
  
}

#Preview {
    HintView(answer: "apple")
}
