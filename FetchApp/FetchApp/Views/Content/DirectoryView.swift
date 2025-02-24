//
//  DirectoryView.swift
//  FetchApp
//
//  Created by Natasha Martinez on 2/24/25.
//

import SwiftUI

struct DirectoryView: View {
    private enum Padding {
        static let contentOffset: CGFloat = 50.0
    }
    
    let recipes: [Recipe]
    let title: String
    @Binding var shouldScrollToTop: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .foregroundStyle(.black)
                .padding(EdgeInsets(top: 0, leading: Padding.contentOffset, bottom: 0, trailing: 0))
            
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    ScrollableTopView(reader: proxy, scrollOnChange: $shouldScrollToTop)
                    
                    LazyHStack(spacing: 25) {
                        ForEach(recipes, id: \.self) { recipe in
                            Button {
                                print("User tapped \(recipe.name)")
                            } label: {
                                DirectoryCellView(recipe: recipe)
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                            }
                        }
                        
                        Spacer(minLength: Padding.contentOffset)
                    }
                }
                .contentMargins(.leading, Padding.contentOffset, for: .scrollContent)
            }
        }
    }
}

#Preview {
    @State var shouldScrollToTop = true
    return DirectoryView(recipes: [], title: "", shouldScrollToTop: $shouldScrollToTop)
}
