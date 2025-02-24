//
//  Sorting.swift
//  FetchApp
//
//  Created by Natasha Martinez on 2/24/25.
//

import Foundation

class Sorting {
    
    struct SortType: Identifiable {
        var id: String { description.rawValue }
        let description: SortTypes
        
        enum SortTypes: String {
            case alphabetical
            case cuisine
            
            static var all = [alphabetical, cuisine]
        }
    }
    
    static func sort(by sort: SortType.SortTypes, content: [Recipe]) -> [String: [Recipe]] {
        switch sort {
            case .alphabetical:
                return sortAlphabetically(content: content)
            case .cuisine:
                return sortCuisine(content: content)
        }
    }
    
    private static func sortAlphabetically(content: [Recipe]) -> [String: [Recipe]] {
        let sorted = content.sorted(by: { $0.name < $1.name })
        return ["Alphabetical": sorted]
    }
    
    private static func sortCuisine(content: [Recipe]) -> [String: [Recipe]] {
        Dictionary(grouping: content){ $0.cuisine }
    }
}
