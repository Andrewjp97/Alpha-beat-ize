//
//  CategorySelectionView.swift
//  Alpha-beat-ize
//
//  Created by Andrew Paterson on 8/3/24.
//

import SwiftUI

struct CategorySelectionView: View {
  var body: some View {
    NavigationStack{
      ZStack {
        Rectangle()
          .foregroundStyle(.accent)
          .ignoresSafeArea()
        List {
          Text("Categories")
            .font(.system(size: 50))
            .foregroundStyle(.accent)
          NavigationLink("Cities", destination: GameView(gameName: "cities"))
            .font(.system(size: 30))
            .foregroundStyle(.accent)
          NavigationLink("Fruits", destination: GameView(gameName: "fruits"))
            .font(.system(size: 30))
            .foregroundStyle(.accent)
          NavigationLink("Vegetables", destination: GameView(gameName: "vegetables"))
            .font(.system(size: 30))
            .foregroundStyle(.accent)
        }
      }
    }
    .tint(.white)
  }
}
  
  #Preview {
    CategorySelectionView()
  }
