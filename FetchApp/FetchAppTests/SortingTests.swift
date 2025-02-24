//
//  SortingTests.swift
//  FetchAppTests
//
//  Created by Natasha Martinez on 2/24/25.
//

@testable import FetchApp
import XCTest

final class SortingTests: XCTestCase {
    
    let recipes = [
        Recipe(cuisine: "American", name: "Apple Cake", photo_url_large: nil, photo_url_small: nil, uuid: "1", source_url: nil, youtube_url: nil),
       Recipe(cuisine: "American", name: "Beet Cake", photo_url_large: nil, photo_url_small: nil, uuid: "2", source_url: nil, youtube_url: nil),
       Recipe(cuisine: "Argentinian", name: "Alphabet Soup", photo_url_large: nil, photo_url_small: nil, uuid: "3", source_url: nil, youtube_url: nil)
    ]

    @MainActor 
    func testSortAlphabetically() {
        let state = StateModel(recipes: recipes)
        state.sort(by: .alphabetical)
        
        XCTAssertEqual(state.recipes.count, 1)
        XCTAssertEqual(state.recipes["Alphabetical"]?.count, 3)
        XCTAssertEqual(state.recipes["Alphabetical"]?[0].name, "Alphabet Soup")
        XCTAssertEqual(state.recipes["Alphabetical"]?[1].name, "Apple Cake")
        XCTAssertEqual(state.recipes["Alphabetical"]?[2].name, "Beet Cake")
    }
    
    @MainActor
    func testSortCuisine() {
        let state = StateModel(recipes: recipes)
        state.sort(by: .cuisine)
        
        XCTAssertEqual(state.recipes.count, 2)
        XCTAssertEqual(state.recipes["American"]?.count, 2)
        XCTAssertEqual(state.recipes["American"]?[0].name, "Apple Cake")
        XCTAssertEqual(state.recipes["American"]?[1].name, "Beet Cake")
        XCTAssertEqual(state.recipes["Argentinian"]?.count, 1)
        XCTAssertEqual(state.recipes["Argentinian"]?[0].name, "Alphabet Soup")
    }
}
