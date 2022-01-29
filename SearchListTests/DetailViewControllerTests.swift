//
//  DetailViewControllerTests.swift
//  SearchListTests
//
//  Created by Mohammad Zulqurnain on 29/01/2022.
//

import XCTest
@testable import SearchList

class DetailViewControllerTests: XCTestCase {

    var sut: DetailViewController?
    
    override func setUpWithError() throws {
        sut = DetailViewController()
        sut?.detailViewModel = DetailViewModel(itemDetail: ListItemDetail(title: "Lorem ipsum dolor", detail: "Lorem ipsum dolor sit amet, consectetur adipsicing elit, sed do eiusmod tempor incidunt ut labore et dolore magna aliqua"))
        sut?.simulateLifeCycle()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testSetupDetailView() {
        XCTAssertEqual(sut?.detailView.titleLabel.text, "Lorem ipsum dolor")
        XCTAssertEqual(sut?.detailView.descriptionLabel.text, "Lorem ipsum dolor sit amet, consectetur adipsicing elit, sed do eiusmod tempor incidunt ut labore et dolore magna aliqua")
        XCTAssertEqual(sut?.detailView.translatesAutoresizingMaskIntoConstraints, false)
    }
    
}
