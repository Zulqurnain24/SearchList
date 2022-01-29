//
//  ListViewModel.swift
//  SearchList
//
//  Created by Mohammad Zulqurnain on 26/01/2022.
//

import Foundation

protocol ListViewModelProtocol {
    func fetchData(fileName: String?,
                   searchTerm: String?,
                   failureCompletionHandler: ((String) -> Void)?)
}

class ListViewModel: ListViewModelProtocol {
    var itemList = ItemList() {
        didSet {
            guard let listItems = itemList.items,
                  listItems.count > IntConstants.zero.rawValue
            else {
                refreshCompletionHandler?()
                return
            }
            refreshCompletionHandler?()
        }
    }
    
    var dataManager = DataManager()
    
    var refreshCompletionHandler: (() -> Void)? = nil
    
    func fetchData(fileName: String? = StringConstants.listItemsStubFileName.rawValue, searchTerm: String? = nil,
                   failureCompletionHandler: ((String) -> Void)? = nil) {

        dataManager.getListItemsFrom(fileName: fileName ?? StringConstants.listItemsStubFileName.rawValue) { [weak self] (result: Result<ItemList, ErrorMessage>) in
            switch result {
            case .success(let itemList):
                guard let searchTerm = searchTerm,
                      !searchTerm.isEmpty else {
                    self?.itemList.items = itemList.items
                    return
                }
                let filteredListItems = itemList.items?
                                                .filter {$0.title.contains("\(searchTerm)")
                                                         ||
                                                         $0.description.contains( "\(searchTerm)")}
                self?.itemList.items = filteredListItems
            case .failure(let errorMessage):
                failureCompletionHandler?(errorMessage.rawValue)
            }
        }
    }
}
