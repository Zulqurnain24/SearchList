//
//  EnumTests.swift
//  SearchListTests
//
//  Created by Mohammad Zulqurnain on 27/01/2022.
//

import XCTest
@testable import SearchList

class EnumTests: XCTestCase {

    func testStringConstants() throws {
        
        XCTAssertEqual(StringConstants.searchTitle.rawValue, "Search:")
        XCTAssertEqual(StringConstants.tableTitle.rawValue, "Results")
        XCTAssertEqual(StringConstants.searchField.rawValue, "searchField")
        XCTAssertEqual(StringConstants.exampleSearchText.rawValue, "Example search text")
        XCTAssertEqual(StringConstants.listItemsStubFileName.rawValue, "listItems")
        XCTAssertEqual(StringConstants.errorAlertTitle.rawValue, "Error")
        XCTAssertEqual(StringConstants.stubFileType.rawValue, "json")
    }

    func testIntConstants() throws {
        
        XCTAssertEqual(IntConstants.zero.rawValue, 0)
        XCTAssertEqual(IntConstants.borderWidth.rawValue, 1)
        XCTAssertEqual(IntConstants.horizontalMargin.rawValue, 10)
        XCTAssertEqual(IntConstants.cornerRadius.rawValue, 5)
        XCTAssertEqual(IntConstants.searchBarPlaceHolderXOffset.rawValue, -20)
        XCTAssertEqual(IntConstants.descriptionLabelHeight.rawValue, 21)
        XCTAssertEqual(IntConstants.labelDefaultWidth.rawValue, 42)
        XCTAssertEqual(IntConstants.labelDefaultHeight.rawValue, 100)
    }
}
