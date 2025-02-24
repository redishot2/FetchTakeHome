//
//  StateModel.swift
//  FetchApp
//
//  Created by Natasha Martinez on 2/24/25.
//

import Foundation
import SwiftUI

class StateModel: ObservableObject {
    private var selectedURL = Networking.URLs.valid
    private var selectedSort: Sorting.SortType.SortTypes = .cuisine
    
    @Published private(set) var isLoading = true
    @Published private(set) var networkingError: Networking.NetworkingError?
    
    /// Original unsorted from API
    private var recipesRaw: [Recipe] = []
    
    /// Sorted into sub categories for display use
    @Published private(set) var recipes: [String: [Recipe]] = [:]
    
    init(recipes: [Recipe] = []) {
        self.recipesRaw = recipes
    }
    
    @MainActor
    func fetch(_ url: Networking.URLInfo = Networking.URLs.valid) async {
        // Reset
        selectedURL = url
        recipesRaw = []
        recipes = [:]
        networkingError = nil
        isLoading = true
        
        let result = await Networking.fetchData(url: selectedURL.url)
        isLoading = false
        
        switch result {
            case .success(let recipes):
                self.recipesRaw = recipes
                sort(by: selectedSort)
            case .failure(let error):
                self.networkingError = error
        }
    }
    
    @MainActor
    func sort(by sortType: Sorting.SortType.SortTypes) {
        selectedSort = sortType
        recipes = Sorting.sort(by: sortType, content: recipesRaw)
    }
}
