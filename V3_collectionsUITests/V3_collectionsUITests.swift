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
    
    
    
    
    
    
    //    func testLaunchPerformance() throws {
    //        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
    //            // This measures how long it takes to launch your application.
    //            measure(metrics: [XCTApplicationLaunchMetric()]) {
    //                XCUIApplication().launch()
    //            }
    //        }
    //    }
}



//        let tablesQuery = app.tables
////        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Set"]/*[[".cells.staticTexts[\"Set\"]",".staticTexts[\"Set\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
////        app.navigationBars["Set"].buttons["Collections"].tap()
//        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Array"]/*[[".cells.staticTexts[\"Array\"]",".staticTexts[\"Array\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//
//        let collectionViewsQuery = app.collectionViews
//        collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Create array for 10 mln elements: "]/*[[".cells.staticTexts[\"Create array for 10 mln elements: \"]",".staticTexts[\"Create array for 10 mln elements: \"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Insert 1000 elements at the beginning / of the array one-by-one"]/*[[".cells.staticTexts[\"Insert 1000 elements at the beginning \/ of the array one-by-one\"]",".staticTexts[\"Insert 1000 elements at the beginning \/ of the array one-by-one\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Insert 1000 elements at the beginning / of the array at once"]/*[[".cells.staticTexts[\"Insert 1000 elements at the beginning \/ of the array at once\"]",".staticTexts[\"Insert 1000 elements at the beginning \/ of the array at once\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Insert 1000 elements in the middle of / the array one-by-one"]/*[[".cells.staticTexts[\"Insert 1000 elements in the middle of \/ the array one-by-one\"]",".staticTexts[\"Insert 1000 elements in the middle of \/ the array one-by-one\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Insert 1000 elements in the middle of / the array all at once"]/*[[".cells.staticTexts[\"Insert 1000 elements in the middle of \/ the array all at once\"]",".staticTexts[\"Insert 1000 elements in the middle of \/ the array all at once\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app.navigationBars["Array"].buttons["Collections"].tap()


//=========================================
//        let arrayControllerCell = app.tables/*@START_MENU_TOKEN@*/.staticTexts["Array"]/*[[".cells.staticTexts[\"Array\"]",".staticTexts[\"Array\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        XCTAssertTrue(arrayControllerCell.exists)
//
//        arrayControllerCell.tap()
//
//        let collectionViewsQuery = app.collectionViews
//
//        let cell10mlnForElementsArray = collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Create array for 10 mln elements: "]/*[[".cells.staticTexts[\"Create array for 10 mln elements: \"]",".staticTexts[\"Create array for 10 mln elements: \"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        XCTAssertTrue(cell10mlnForElementsArray.exists)
//
//        cell10mlnForElementsArray.tap()
//

//        let insertAtBeginingOfArray1by1 = collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Insert 1000 elements at the beginning / of the array one-by-one"]/*[[".cells.staticTexts[\"Insert 1000 elements at the beginning \/ of the array one-by-one\"]",".staticTexts[\"Insert 1000 elements at the beginning \/ of the array one-by-one\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        XCTAssertTrue(insertAtBeginingOfArray1by1.exists)
//        insertAtBeginingOfArray1by1.tap()


