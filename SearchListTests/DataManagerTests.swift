//
//  AlertableTests.swift
//  SearchListTests
//
//  Created by Mohammad Zulqurnain on 28/01/2022.
//

import XCTest
@testable import SearchList

class DataManagerTests: XCTestCase {

    var sut: DataManager?
    
    override func setUpWithError() throws {
        sut = DataManager()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testGetListItemsFrom() throws {
        let expectation = expectation(description: #function)
        sut?.getListItemsFrom(fileName: "listItems") { (result: Result<ItemList, ErrorMessage>) in
            switch result {
            case .success(let itemList):
                XCTAssertTrue(itemList.items?.count == 3)
                
                let firstItem = itemList.items?[0]
                XCTAssertEqual(firstItem?.title, "Lorem ipsum dolor")
                XCTAssertEqual(firstItem?.description, "Duis aute irure dolor")
                XCTAssertEqual(firstItem?.detail, "Lorem ipsum dolor sit amet, consectetur adipsicing elit, sed do eiusmod tempor incidunt ut labore et dolore magna aliqua")
                
                let secondItem = itemList.items?[1]
                XCTAssertEqual(secondItem?.title, "Item 2")
                XCTAssertEqual(secondItem?.description, "This is item 2")
                XCTAssertEqual(secondItem?.detail, "Item 2 is item 2")
                
                let thirdItem = itemList.items?[2]
                XCTAssertEqual(thirdItem?.title, "Item 3")
                XCTAssertEqual(thirdItem?.description, "This is item 3")
                XCTAssertEqual(thirdItem?.detail, "Item 3 is item 3")
                
                expectation.fulfill()
            case .failure(_): break
               
            }
        }
        self.waitForExpectations(timeout: 5)
    }
    
}
