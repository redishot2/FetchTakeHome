//
//  FlavorTextView.swift
//  FetchApp
//
//  Created by Natasha Martinez on 2/24/25.
//

import SwiftUI

struct FlavorTextView: View {
    let recipe: Recipe
    
    var body: some View {
        VStack {
            Text(recipe.name)
                .font(.system(size: 18))
                .bold()
                .foregroundColor(.black)
                .minimumScaleFactor(0.01)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .frame(height: 25)
                .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
            
            rating(4)
                .padding(EdgeInsets(top: -5, leading: 0, bottom: 10, trailing: 0))
            
            HStack {
                subHeadline(text: "30 mins", systemImage: "timer")
                Spacer()
                subHeadline(text: "2 servings", systemImage: "person")
            }
            .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
            
            subHeadline(text: recipe.cuisine, systemImage: "globe.americas.fill")
        }
    }
    
    func subHeadline(text: String, systemImage: String) -> some View {
        HStack {
            Image(systemName: systemImage)
                .resizable()
                .frame(width: 12, height: 12)
                .foregroundStyle(Color.gray)
            
            Text(text)
                .font(.footnote)
                .foregroundStyle(Color.gray)
        }
    }
    
    func rating(_ stars: Int) -> some View {
        let totalStars: Int = 5
        
        return HStack {
            ForEach(0..<totalStars, id: \.self) { i in
                let fillColor = i < stars ? Color.yellow : Color.gray
                
                Image(systemName: "star.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 17, height: 17)
                    .foregroundStyle(fillColor)
            }
        }
    }
}

#Preview {
    FlavorTextView(recipe: Recipe(cuisine: "", name: "", photo_url_large: "", photo_url_small: "", uuid: "", source_url: "", youtube_url: ""))
}
