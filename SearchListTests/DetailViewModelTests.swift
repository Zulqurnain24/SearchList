//
//  DetailViewModelTests.swift
//  SearchListTests
//
//  Created by Mohammad Zulqurnain on 29/01/2022.
//

import XCTest
@testable import SearchList

class DetailViewModelTests: XCTestCase {

    var sut: DetailViewModel?
    
    override func setUpWithError() throws {
        sut = DetailViewModel(itemDetail: ListItemDetail(title: "Lorem ipsum dolor", detail: "Lorem ipsum dolor sit amet, consectetur adipsicing elit, sed do eiusmod tempor incidunt ut labore et dolore magna aliqua"))
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testSetupViews() {
        XCTAssertEqual(sut?.itemDetail?.title, "Lorem ipsum dolor")
        XCTAssertEqual(sut?.itemDetail?.detail, "Lorem ipsum dolor sit amet, consectetur adipsicing elit, sed do eiusmod tempor incidunt ut labore et dolore magna aliqua")
    }
}
