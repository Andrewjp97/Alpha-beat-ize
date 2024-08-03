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
          NavigationLink("Animals", destination: GameView(gameName: "animals"))
            .font(.system(size: 30))
            .foregroundStyle(.accent)
          NavigationLink("Bands", destination: GameView(gameName: "bands"))
            .font(.system(size: 30))
            .foregroundStyle(.accent)
          NavigationLink("Brands", destination: GameView(gameName: "brands"))
            .font(.system(size: 30))
            .foregroundStyle(.accent)
          NavigationLink("Cities", destination: GameView(gameName: "cities"))
            .font(.system(size: 30))
            .foregroundStyle(.accent)
          NavigationLink("Clothing", destination: GameView(gameName: "clothing"))
            .font(.system(size: 30))
            .foregroundStyle(.accent)
          NavigationLink("Colors", destination: GameView(gameName: "colors"))
            .font(.system(size: 30))
            .foregroundStyle(.accent)
          NavigationLink("Flowers", destination: GameView(gameName: "flowers"))
            .font(.system(size: 30))
            .foregroundStyle(.accent)
          NavigationLink("Fruits", destination: GameView(gameName: "fruits"))
            .font(.system(size: 30))
            .foregroundStyle(.accent)
          NavigationLink("Music Genres", destination: GameView(gameName: "musicgenres"))
            .font(.system(size: 30))
            .foregroundStyle(.accent)
          NavigationLink("Song Titles", destination: GameView(gameName: "songtitles"))
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
