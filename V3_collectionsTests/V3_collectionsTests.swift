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
   
    //MARK: SetController
    func testSetMatchChars(intersectionResult: String) throws {
        let text1 = "Temp"   // correct answer - "e", "m", "p"
        let text2 = "amper"
        let charSet1 = Set(text1)
        let charSet2 = Set(text2)
        let intersectionResultTest = String(charSet1.intersection(charSet2))
        
        let setManagerResult = setManager.findMatching(textField1: text1, textField2: text2)
        
        XCTAssertEqual(intersectionResultTest, setManagerResult)
    }
    func testSetNotMatchChars(symmetricDifferenceResult: String) throws {
        let text1 = "Temp"   // correct answer - "T", "a", "r""
        let text2 = "amper"
        let charSet1 = Set(text1)
        let charSet2 = Set(text2)
        let intersectionResultTest = String(charSet1.symmetricDifference(charSet2))
        
        let setManagerResult = setManager.findDifference(textFromTF1: text1, textFromTF2: text2)
        
        XCTAssertEqual(intersectionResultTest, setManagerResult)
    }
    func testSetUnqiaueChars(symmetricDifferenceResult: String) {
        let text1 = "Temp"   // correct answer - "T"
        let text2 = "amper"
        let charSet1 = Set(text1)
        let charSet2 = Set(text2)
        let intersectionResult = charSet1.intersection(charSet2)
        let unitedSet = intersectionResult.union(charSet2)
        let uniqueCharSet = String(charSet1.subtracting(unitedSet))
        
        let setManagerResult = setManager.findUniqueChars(textFromTF1: text1, textFromTF2: text2)
        
        XCTAssertEqual(uniqueCharSet, setManagerResult)
    }
}


