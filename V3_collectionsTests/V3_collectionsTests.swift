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

//    func testExample() throws {
 
        // Zxcdfvbn
        //Asdfcvgh
        
        //dfcv
        //Zbgaxnhs
        //zxnb
        

//        func testSetMatchChars() {
//            let text1 = "Hnkj" //"Zxcdfvbn"
//            let text2 = "World" //"Asdfcvgh"
//            let answerLabel = UILabel()
//
//            let charSet1 = Set(text1)
//            let charSet2 = Set(text2)
//            let intersectionResultTest = String(charSet1.intersection(charSet2))
//
//            setManager.findMatching(textField1: text1, textField2: text2, answerLabel1: answerLabel)
////            XCTAssert(true)
//            XCTAssertEqual(EquatableintersectionResultTest, EquatableintersectionResult)
//        }
        
        
//        func testSetNotMatchChars
//
//        func testSetUnqiaueChars
        
        
        
        
//    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
