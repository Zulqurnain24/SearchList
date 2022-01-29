//
//  ListViewModelTests.swift
//  SearchListTests
//
//  Created by Mohammad Zulqurnain on 29/01/2022.
//

import XCTest
@testable import SearchList

class ListViewModelTests: XCTestCase {

    var sut: ListViewModel?
    
    override func setUpWithError() throws {
        sut = ListViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testInit() throws {
        XCTAssertNotNil(sut?.dataManager)
        XCTAssertNotNil(sut?.itemList)
    }

    func testFetchData() throws {
        sut?.fetchData()
        XCTAssertEqual(sut?.itemList.items?.count, 3)
        let firstItem = self.sut?.itemList.items?[0]
        XCTAssertEqual(firstItem?.title, "Lorem ipsum dolor")
        XCTAssertEqual(firstItem?.description, "Duis aute irure dolor")
        XCTAssertEqual(firstItem?.detail, "Lorem ipsum dolor sit amet, consectetur adipsicing elit, sed do eiusmod tempor incidunt ut labore et dolore magna aliqua")
        
        let secondItem = self.sut?.itemList.items?[1]
        XCTAssertEqual(secondItem?.title, "Item 2")
        XCTAssertEqual(secondItem?.description, "This is item 2")
        XCTAssertEqual(secondItem?.detail, "Item 2 is item 2")
        
        let thirdItem = self.sut?.itemList.items?[2]
        XCTAssertEqual(thirdItem?.title, "Item 3")
        XCTAssertEqual(thirdItem?.description, "This is item 3")
        XCTAssertEqual(thirdItem?.detail, "Item 3 is item 3")
    }
    
    func testFetchDataWithSearchTerm() throws {
        sut?.fetchData(searchTerm: "Lorem")
        XCTAssertEqual(sut?.itemList.items?.count, 1)
    }
   
    func testFetchDataWithFailure() throws {
        sut?.fetchData(fileName: "wrongFileName")
        XCTAssertEqual(sut?.itemList.items?.count, nil)
    }
    
    func testFetchDataWithSearchFailure() throws {
        sut?.fetchData(fileName: "wrongFileName", searchTerm: "")
        XCTAssertEqual(sut?.itemList.items?.count, nil)
    }
}
