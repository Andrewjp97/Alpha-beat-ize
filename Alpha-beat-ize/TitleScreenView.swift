//
//  TitleScreenView.swift
//  Alpha-beat-ize
//
//  Created by Andrew Paterson on 8/3/24.
//

import SwiftUI

struct TitleScreenView: View {
  @State private var displayingCategorySelection: Bool = false
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.accent)
                .ignoresSafeArea()
            VStack {
                Text("Alpha-beat-ize")
                    .font(.system(size: 50))
                    .foregroundStyle(.white)
                Button("Start") {
                    displayingCategorySelection = true
                }
                .font(.system(size: 50))
                .foregroundStyle(.white)
            }
        }
        .fullScreenCover(isPresented: $displayingCategorySelection) {
            CategorySelectionView()
        }
    }
}

#Preview {
    TitleScreenView()
}
