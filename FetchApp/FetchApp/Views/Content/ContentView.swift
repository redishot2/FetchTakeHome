//
//  ContentView.swift
//  FetchApp
//
//  Created by Natasha Martinez on 2/24/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var stateModel = StateModel()
    @State private var shouldScrollToTop = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                
                if stateModel.isLoading {
                    LoadingView()
                } else if stateModel.networkingError != nil {
                    let error = stateModel.networkingError ?? Networking.NetworkingError(description: .emptyURL)
                    DirectoryErrorView(networkError: error)
                        .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40))
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(stateModel.recipes.keys.sorted(), id: \.self) { title in
                            if let recipes = stateModel.recipes[title] {
                                DirectoryView(recipes: recipes, title: title, shouldScrollToTop: $shouldScrollToTop)
                                    .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
                            }
                        }
                        
                        Spacer(minLength: 60)
                    }
                }
            }
            .onAppear {
                Task {
                    await stateModel.fetch()
                }
            }
            .toolbar {
                URLSelectionButton { urlInfo in
                    Task {
                        await stateModel.fetch(urlInfo)
                    }
                    
                    shouldScrollToTop.toggle()
                }
                
                SortingButton { sortType in
                    stateModel.sort(by: sortType)
                    shouldScrollToTop.toggle()
                }
            }
            .navigationTitle("Recipes")
            .toolbarBackground(.backgroundColor1, for: .automatic)
            .toolbarBackground(.visible, for: .automatic)
        }
    }
}

#Preview {
    ContentView()
}
