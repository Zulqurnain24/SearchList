//
//  ListViewControllerTests.swift
//  SearchListTests
//
//  Created by Mohammad Zulqurnain on 29/01/2022.
//

import XCTest
@testable import SearchList

class ListViewControllerTests: XCTestCase {

    var sut: ListViewController?
    
    override func setUpWithError() throws {
        sut = ListViewController()
        sut?.simulateLifeCycle()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func setupNavigationBarAppearance() throws {
        XCTAssertEqual(sut?.navigationController?.navigationBar.tintColor, .black)
    }
    
    func testSetupTitle() throws {

        let leftButtonItemCustomViewLabel: UILabel? = sut?.navigationItem.leftBarButtonItem?.customView as? UILabel
        XCTAssertEqual(leftButtonItemCustomViewLabel?.text, "Search:")
    }

    func testSetupViewModel() throws {

        XCTAssertNotNil(sut?.listViewModel.refreshCompletionHandler)
    }

    func testSetupTableView() throws {

        XCTAssertNotNil(sut?.tableView.dataSource)
        XCTAssertNotNil(sut?.tableView.delegate)
        XCTAssertEqual(sut?.tableView.rowHeight, UITableView.automaticDimension)
        XCTAssertEqual(sut?.tableView.translatesAutoresizingMaskIntoConstraints, false)
        XCTAssertEqual(sut?.tableView.separatorStyle, UITableViewCell.SeparatorStyle.none)
    }

    func testLoadData() throws {

        sut?.loadData()
        XCTAssertEqual(sut?.listViewModel.itemList.items?.count, 3)
        let firstItem = sut?.listViewModel.itemList.items?[0]
        XCTAssertEqual(firstItem?.title, "Lorem ipsum dolor")
        XCTAssertEqual(firstItem?.description, "Duis aute irure dolor")
        XCTAssertEqual(firstItem?.detail, "Lorem ipsum dolor sit amet, consectetur adipsicing elit, sed do eiusmod tempor incidunt ut labore et dolore magna aliqua")

        let secondItem = sut?.listViewModel.itemList.items?[1]
        XCTAssertEqual(secondItem?.title, "Item 2")
        XCTAssertEqual(secondItem?.description, "This is item 2")
        XCTAssertEqual(secondItem?.detail, "Item 2 is item 2")

        let thirdItem = sut?.listViewModel.itemList.items?[2]
        XCTAssertEqual(thirdItem?.title, "Item 3")
        XCTAssertEqual(thirdItem?.description, "This is item 3")
        XCTAssertEqual(thirdItem?.detail, "Item 3 is item 3")
    }

    func testLoadDataWithFailure() throws {

        sut?.loadData(fileName: "wrongFileName")
    }

    func testSetupSearchBar() throws {
        XCTAssertEqual(sut?.searchController.searchBar.layer.borderColor, UIColor.black.cgColor)
        XCTAssertEqual(sut?.searchController.searchBar.searchTextField.layer.borderWidth, CGFloat(IntConstants.borderWidth.rawValue))
        XCTAssertEqual(sut?.searchController.searchBar.searchTextField.backgroundColor, .white)
        XCTAssertEqual(sut?.searchController.searchBar.searchTextField.layer.cornerRadius, CGFloat(IntConstants.cornerRadius.rawValue))
        XCTAssertEqual(sut?.searchController.searchBar.searchTextField.clipsToBounds, true)
        XCTAssertEqual(sut?.searchController.searchBar.searchTextField.leftView?.isHidden, true)
        XCTAssertEqual(UISearchBar.appearance().searchTextPositionAdjustment, UIOffset(horizontal: CGFloat(IntConstants.searchBarPlaceHolderXOffset.rawValue), vertical: CGFloat(IntConstants.zero.rawValue)))
        XCTAssertEqual(sut?.definesPresentationContext, true)
        XCTAssertEqual(sut?.navigationItem.searchController, sut?.searchController)
        XCTAssertEqual(sut?.navigationItem.hidesSearchBarWhenScrolling, false)
        XCTAssertNotNil(sut?.searchController.searchBar.delegate)
        XCTAssertEqual((sut?.searchController.searchBar.value(forKey: StringConstants.searchField.rawValue) as? UITextField)?.placeholder, "Example search text")
    }

    func testSearchBar() throws {
        sut?.searchBar(UISearchBar(), textDidChange: "")
        XCTAssertEqual(sut?.listViewModel.itemList.items?.count, 3)
        let firstItem = sut?.listViewModel.itemList.items?[0]
        XCTAssertEqual(firstItem?.title, "Lorem ipsum dolor")
        XCTAssertEqual(firstItem?.description, "Duis aute irure dolor")
        XCTAssertEqual(firstItem?.detail, "Lorem ipsum dolor sit amet, consectetur adipsicing elit, sed do eiusmod tempor incidunt ut labore et dolore magna aliqua")

        let secondItem = sut?.listViewModel.itemList.items?[1]
        XCTAssertEqual(secondItem?.title, "Item 2")
        XCTAssertEqual(secondItem?.description, "This is item 2")
        XCTAssertEqual(secondItem?.detail, "Item 2 is item 2")

        let thirdItem = sut?.listViewModel.itemList.items?[2]
        XCTAssertEqual(thirdItem?.title, "Item 3")
        XCTAssertEqual(thirdItem?.description, "This is item 3")
        XCTAssertEqual(thirdItem?.detail, "Item 3 is item 3")
    }
    
}
