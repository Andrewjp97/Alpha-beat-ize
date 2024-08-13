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
          GameNavigationLinkView(title: "Animals", gameName: "animals")
          GameNavigationLinkView(title: "Bands", gameName: "bands")
          GameNavigationLinkView(title: "Brands", gameName: "brands")
          GameNavigationLinkView(title: "US Cities", gameName: "cities")
          GameNavigationLinkView(title: "Clothing", gameName: "clothing")
          GameNavigationLinkView(title: "Colors", gameName: "colors")
          GameNavigationLinkView(title: "Flowers", gameName: "flowers")
          GameNavigationLinkView(title: "Fruits", gameName: "fruits")
          GameNavigationLinkView(title: "Music Genres", gameName: "musicgenres")
          GameNavigationLinkView(title: "Pokemon", gameName: "pokemon")
          GameNavigationLinkView(title: "Song Titles", gameName: "songtitles")
          GameNavigationLinkView(title: "Vegetables", gameName: "vegetables")
        }
      }
    }
    .tint(.accentColor)
  }
}
  
  #Preview {
    CategorySelectionView()
  }

struct GameNavigationLinkView: View {
  var title: String
  var gameName: String
  var body: some View {
    NavigationLink(title, destination: GameView(gameName: gameName, title: title))
      .font(.system(size: 30))
      .foregroundStyle(.accent)
  }
}
