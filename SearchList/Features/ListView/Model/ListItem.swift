//
//  Item.swift
//  SearchList
//
//  Created by Mohammad Zulqurnain on 26/01/2022.
//

import Foundation

struct ListItem: Codable {
    let title: String
    let description: String
    let detail: String
}

struct ItemList: Codable {
    var items: [ListItem]?
}
