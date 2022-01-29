//
//  ErrorMessages.swift
//  SearchListTests
//
//  Created by Mohammad Zulqurnain on 28/01/2022.
//

import XCTest
@testable import SearchList

class ErrorMessagesTests: XCTestCase {

    func testValues() throws {
        XCTAssertEqual(ErrorMessage.invalidData.rawValue, "Sorry. Somthing went wrong, try again")
        XCTAssertEqual(ErrorMessage.invalidResponse.rawValue, "Data error. Please modify your search and try again")
    }
    
    func checkCases() throws {
        XCTAssertEqual(ErrorMessage.allCases.count, 2)
    }
}
