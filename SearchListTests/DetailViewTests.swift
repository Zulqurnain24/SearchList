//
//  DetailViewTests.swift
//  SearchListTests
//
//  Created by Mohammad Zulqurnain on 29/01/2022.
//

import XCTest
@testable import SearchList

class DetailViewTests: XCTestCase {

    var sut: DetailView?
    
    override func setUpWithError() throws {
        sut = DetailView()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testSetupViews() {
        XCTAssertEqual(sut?.subviews.filter {$0 is UILabel}.count, 2)
    }
    
    func testSetupConstraints() {
        XCTAssertEqual(sut?.translatesAutoresizingMaskIntoConstraints, false)
        XCTAssertEqual(sut?.titleLabel.translatesAutoresizingMaskIntoConstraints, false)
    }
}
