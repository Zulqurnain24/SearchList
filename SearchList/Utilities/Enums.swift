//
//  Enums.swift
//  SearchList
//
//  Created by Mohammad Zulqurnain on 27/01/2022.
//

enum StringConstants: String {
    typealias RawValue = String
    
    case searchTitle = "Search:"
    case tableTitle = "Results"
    case searchField = "searchField"
    case exampleSearchText = "Example search text"
    case listItemsStubFileName = "listItems"
    case errorAlertTitle = "Error"
    case stubFileType = "json"
}

enum IntConstants: Int {
    typealias RawValue = Int
    
    case zero = 0
    case borderWidth = 1
    case horizontalMargin = 10
    case cornerRadius = 5
    case padding = 6
    case searchBarPlaceHolderXOffset = -20
    case descriptionLabelHeight = 21
    case labelDefaultWidth = 42
    case labelDefaultHeight = 100
}
