//
//  V3_collectionsUITests.swift
//  V3_collectionsUITests
//
//  Created by Alex on 17.03.2023.
//

import XCTest

final class V3collectionsUITests: XCTestCase {
    
    override func setUpWithError() throws {
    }
    override func tearDownWithError() throws {
    }
    
    func testArrayController() throws {
        let app = XCUIApplication()
        app.launch()
        
        let tablesQuery = app.tables
        let arrayControllerCell = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Array"]/*[[".cells.staticTexts[\"Array\"]",".staticTexts[\"Array\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(arrayControllerCell.exists)
        
        arrayControllerCell.tap()
        
        let collectionViewsQuery = app.collectionViews
        let cell10mlnForElementsArray = collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Create array for 10 mln elements: "]/*[[".cells.staticTexts[\"Create array for 10 mln elements: \"]",".staticTexts[\"Create array for 10 mln elements: \"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(cell10mlnForElementsArray.exists)
        
        cell10mlnForElementsArray.tap()
        sleep(10)
        
        let insertAtBeginingOfArray1by1 = collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Insert 1000 elements at the beginning / of the array one-by-one"]/*[[".cells.staticTexts[\"Insert 1000 elements at the beginning \/ of the array one-by-one\"]",".staticTexts[\"Insert 1000 elements at the beginning \/ of the array one-by-one\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(insertAtBeginingOfArray1by1.exists)
        insertAtBeginingOfArray1by1.tap()
        let insertInTheMiddleOfArray1by1 = collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Insert 1000 elements in the middle of / the array one-by-one"]/*[[".cells.staticTexts[\"Insert 1000 elements in the middle of \/ the array one-by-one\"]",".staticTexts[\"Insert 1000 elements in the middle of \/ the array one-by-one\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(insertInTheMiddleOfArray1by1.exists)
        insertInTheMiddleOfArray1by1.tap()
        let insertInTheMiddleOfArrayAtOnce = collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Insert 1000 elements in the middle of / the array all at once"]/*[[".cells.staticTexts[\"Insert 1000 elements in the middle of \/ the array all at once\"]",".staticTexts[\"Insert 1000 elements in the middle of \/ the array all at once\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(insertInTheMiddleOfArrayAtOnce.exists)
        insertInTheMiddleOfArrayAtOnce.tap()
        let insertInTheEndOfArray1by1 = collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Insert 1000 elements in the end of the array one-by-one"]/*[[".cells.staticTexts[\"Insert 1000 elements in the end of the array one-by-one\"]",".staticTexts[\"Insert 1000 elements in the end of the array one-by-one\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(insertInTheEndOfArray1by1.exists)
        insertInTheEndOfArray1by1.tap()
        let insertInTheEndOfArrayAtOnce = collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Insert 1000 elements in the end of the array all at once"]/*[[".cells.staticTexts[\"Insert 1000 elements in the end of the array all at once\"]",".staticTexts[\"Insert 1000 elements in the end of the array all at once\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(insertInTheEndOfArrayAtOnce.exists)
        insertInTheEndOfArrayAtOnce.tap()
        let removeAtBeginingOfArray1by1 = collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Remove 1000 elements at the beginning of the array one-by-one"]/*[[".cells.staticTexts[\"Remove 1000 elements at the beginning of the array one-by-one\"]",".staticTexts[\"Remove 1000 elements at the beginning of the array one-by-one\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(removeAtBeginingOfArray1by1.exists)
        removeAtBeginingOfArray1by1.tap()
        let removeInTheMiddleOfArray1by1 = collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Remove 1000 elements in the end of the array one-by-one"]/*[[".cells.staticTexts[\"Remove 1000 elements in the end of the array one-by-one\"]",".staticTexts[\"Remove 1000 elements in the end of the array one-by-one\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(removeInTheMiddleOfArray1by1.exists)
        removeInTheMiddleOfArray1by1.tap()
        let removeInTheMiddleOfArrayAtOnce = collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Remove 1000 elements in the middle of the array"]/*[[".cells.staticTexts[\"Remove 1000 elements in the middle of the array\"]",".staticTexts[\"Remove 1000 elements in the middle of the array\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(removeInTheMiddleOfArrayAtOnce.exists)
        removeInTheMiddleOfArrayAtOnce.tap()
        let removeInTheEndOfArray1by1 = collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Remove 1000 elements at the end of the array one-by-one"]/*[[".cells.staticTexts[\"Remove 1000 elements at the end of the array one-by-one\"]",".staticTexts[\"Remove 1000 elements at the end of the array one-by-one\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(removeInTheEndOfArray1by1.exists)
        removeInTheEndOfArray1by1.tap()
        let removeInTheEndOfArrayAtOnce = collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Remove 1000 elements at the end of the array"]/*[[".cells.staticTexts[\"Remove 1000 elements at the end of the array\"]",".staticTexts[\"Remove 1000 elements at the end of the array\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(removeInTheEndOfArrayAtOnce.exists)
        removeInTheEndOfArrayAtOnce.tap()
        
        let returnButton = app.navigationBars["Array"].buttons["Collections"]
        XCTAssertTrue(returnButton.exists)
        returnButton.tap()
    }
    
    func testDictionaryController() throws {
        let app = XCUIApplication()
        app.launch()
        
        let collectionViewsQuery = app.collectionViews
        
        let dictionaryControllerCell = app.tables/*@START_MENU_TOKEN@*/.staticTexts["Dictionary"]/*[[".cells.staticTexts[\"Dictionary\"]",".staticTexts[\"Dictionary\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(dictionaryControllerCell.exists)
        dictionaryControllerCell.tap()
        
        sleep(10)
        
        let collectionViewsQuery2 = app.collectionViews
        let arrayLabel = collectionViewsQuery2/*@START_MENU_TOKEN@*/.staticTexts["Array"]/*[[".cells.staticTexts[\"Array\"]",".staticTexts[\"Array\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(arrayLabel.exists)
        let dictionaryLabel = collectionViewsQuery.staticTexts["Dictionary"]
        XCTAssertTrue(dictionaryLabel.exists)
        let find1stContactArray = collectionViewsQuery2.children(matching: .cell).element(boundBy: 2).staticTexts["Find the first contact"]
        XCTAssertTrue(find1stContactArray.exists)
        find1stContactArray.tap()
        let find1stContactDictionary = collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Find the first contact"]/*[[".cells.staticTexts[\"Find the first contact\"]",".staticTexts[\"Find the first contact\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(find1stContactDictionary.exists)
        find1stContactDictionary.tap()
        let findLastContactInArray = collectionViewsQuery2.children(matching: .cell).element(boundBy: 4).staticTexts["Find the last contact"]
        XCTAssertTrue(findLastContactInArray.exists)
        findLastContactInArray.tap()
        let findLastContactInDictionary = collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Find the last contact"]/*[[".cells.staticTexts[\"Find the last contact\"]",".staticTexts[\"Find the last contact\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(findLastContactInDictionary.exists)
        findLastContactInDictionary.tap()
        let findNonExistingElementInArray = collectionViewsQuery2.children(matching: .cell).element(boundBy: 6).staticTexts["Find the non-existing element"]
        XCTAssertTrue(findNonExistingElementInArray.exists)
        findNonExistingElementInArray.tap()
        let findNonExistingElementInDictionary = collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Find the non-existing element"]/*[[".cells.staticTexts[\"Find the non-existing element\"]",".staticTexts[\"Find the non-existing element\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(findNonExistingElementInDictionary.exists)
        findNonExistingElementInDictionary.tap()
        
        let returnButton = app.navigationBars["Dictionary"].buttons["Collections"]
        XCTAssertTrue(returnButton.exists)
        returnButton.tap()
    }
    
}

