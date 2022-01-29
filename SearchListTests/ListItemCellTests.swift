//
//  ListItemCellTests.swift
//  SearchListTests
//
//  Created by Mohammad Zulqurnain on 29/01/2022.
//

import XCTest
@testable import SearchList

class ListItemCellTests: XCTestCase {

    var sut: ListItemCell?
    var listItem: ListItem?

    override func setUpWithError() throws {
        sut = ListItemCell()
        listItem = ListItem(title: "Item 3", description: "This is item 3", detail: "Item 3 is item 3")
        sut?.populate(with: listItem!)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testPopulate() throws {
        XCTAssertEqual(sut?.textLabel?.text, listItem?.title)
    }
    
    func testCustomizeContentView() throws {
        XCTAssertEqual(sut?.contentView.layer.borderColor, UIColor.black.cgColor)
        XCTAssertEqual(sut?.contentView.layer.borderWidth, 1)
    }
    
    func testLayoutSubviews() throws {
        XCTAssertEqual(sut?.contentView.frame, CGRect(x: 0.0, y: 0.0, width: 320.0, height: 44.0))
    }
}
