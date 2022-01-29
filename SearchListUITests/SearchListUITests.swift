//
//  SearchListUITests.swift
//  SearchListUITests
//
//  Created by Mohammad Zulqurnain on 29/01/2022.
//

import XCTest

class SearchListUITests: XCTestCase {
    
    override func setUpWithError() throws {
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
    }

    func testBasicFlow() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()
        
        app.navigationBars.buttons.element(boundBy: 0).tap()
    }
    
    func testSearchFlow() throws {
        
        let app = XCUIApplication()
        let exampleSearchTextSearchField = app.navigationBars["SearchList.ListView"].searchFields["Example search text"]
        exampleSearchTextSearchField.tap()
        exampleSearchTextSearchField.typeText("Item 3")
        app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()
        
        app.navigationBars.buttons.element(boundBy: 0).tap()
    }
}
