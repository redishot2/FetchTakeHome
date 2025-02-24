//
//  DirectoryCellView.swift
//  FetchApp
//
//  Created by Natasha Martinez on 2/24/25.
//

import SwiftUI

struct DirectoryCellView: View {
    private enum Constants {
        static let imageWidth: CGFloat = 200.0
        static let imageHeight: CGFloat = 150.0
    }
    
    let recipe: Recipe
    
    var body: some View {
        VStack {
            if let imageURL = recipe.photo_url_small, let url = URL(string: imageURL) {
                CacheAsyncImage(url: url) { state in
                    if let image = state.image {
                        image
                            .resizable()
                            .frame(width: Constants.imageWidth, height: Constants.imageHeight)
                            .aspectRatio(contentMode: .fill)
                            .clipped()
                    }
                }
            }
            
            FlavorTextView(recipe: recipe)
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 10, trailing: 10))
        }
        .frame(width: Constants.imageWidth)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 3, x: 3, y: 3)
    }
}

#Preview {
    DirectoryCellView(recipe: Recipe(cuisine: "", name: "", photo_url_large: nil, photo_url_small: nil, uuid: "", source_url: "", youtube_url: ""))
}
