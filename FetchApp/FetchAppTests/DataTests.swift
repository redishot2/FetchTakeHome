//
//  DataTests.swift
//  FetchAppTests
//
//  Created by Natasha Martinez on 2/24/25.
//

@testable import FetchApp
import XCTest

final class DataTests: XCTestCase {
    private enum Constants {
        static let validURL: URL = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")!
        static let mockDataValid = "MockDataValid"
        static let mockDataInvalid = "MockDataInvalid"
        static let mockDataEmpty = "MockDataEmpty"
    }
    
    private func getTestJSON(fileName: String) -> Data? {
        let bundle = Bundle(for: DataTests.self)
        if let path = bundle.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return data
            } catch {
                return nil
            }
        }
        
        return nil
    }
    
    func testValidData() {
        guard let data = getTestJSON(fileName: Constants.mockDataValid) else {
            XCTFail("Local mock JSON not found")
            return
        }
        
        let result = Networking.handleResponse(data: data)
        if case .success(let recipes) = result {
            XCTAssertEqual(recipes.count, 2)
            XCTAssertEqual(recipes[0].cuisine, "Malaysian")
            XCTAssertEqual(recipes[0].photo_url_large, "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg")
            XCTAssertEqual(recipes[0].youtube_url, "https://www.youtube.com/watch?v=6R8ffRRJcrg")
            XCTAssertEqual(recipes[1].name, "Apple & Blackberry Crumble")
            XCTAssertEqual(recipes[1].photo_url_small, nil)
            XCTAssertEqual(recipes[1].youtube_url, nil)
        } else {
            XCTFail("Incorrect result type")
        }
    }
    
    func testData(fileName: String, expectedError: Networking.NetworkingError.ErrorDescription) {
        guard let data = getTestJSON(fileName: fileName) else {
            XCTFail("Local mock JSON not found")
            return
        }
        
        let result = Networking.handleResponse(data: data)
        if case .failure(let error) = result {
            XCTAssertEqual(error, Networking.NetworkingError(description: expectedError))
        } else {
            XCTFail("Incorrect result type")
        }
    }
    
    func testInvalidData() {
        testData(fileName: Constants.mockDataInvalid, expectedError: .decoding)
    }
    
    func testEmptyData() {
        testData(fileName: Constants.mockDataEmpty, expectedError: .emptyURL)
    }
}
