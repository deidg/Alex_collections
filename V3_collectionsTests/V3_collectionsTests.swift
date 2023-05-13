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
        
//        let textField1 = UITextField()
//            let textField2 = UITextField()
//            let answerLabel1 = UILabel()
//            // 2. set the initial state of the objects
//            textField1.text = "Hefdfs"
//            textField2.text = "world"
//            answerLabel1.isHidden = true
//            // 3. call the function being tested
//        setManager.findMatching(textField1: textField1.text!, textField2: textField2.text!, answerLabel1: answerLabel1)
//            // 4. check if the answerLabel1 text is set to the correct value
//            XCTAssertEqual(answerLabel1.text, "ef")

//        func testSetMatchChars() {
//            let text1 = "Hello" //"Zxcdfvbn"
//            let text2 = "World" //"Asdfcvgh"
//            let answerLabel = UILabel()
//
//            setManager.findMatching(textField1: text1, textField2: text2, answerLabel1: answerLabel)
//            XCTAssertEqual(answerLabel.text, "lo")
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
