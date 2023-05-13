//
//  V3_collectionsTests.swift
//  V3_collectionsTests
//
//  Created by Alex on 17.03.2023.
//

import XCTest
@testable import V3_collections

final class V3collectionsTests: XCTestCase {
    var arrayManager: ArrayManager!
    var setManager: SetManager!
    var dictionaryManager: DictionaryManager!
    
    override func setUpWithError() throws {
         try super.setUpWithError()
         arrayManager = ArrayManager()
         setManager = SetManager()
         dictionaryManager = DictionaryManager()
    }

    override func tearDownWithError() throws {
        arrayManager = nil
        setManager = nil
        dictionaryManager = nil
        try super.tearDownWithError()
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete.
//        Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
