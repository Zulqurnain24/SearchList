//
//  ErrorMessages.swift
//  SearchList
//
//  Created by Mohammad Zulqurnain on 26/01/2022.
//

import Foundation

enum ErrorMessage: String, Error, CaseIterable {
    case invalidData = "Sorry. Somthing went wrong, try again"
    case invalidResponse = "Data error. Please modify your search and try again"
}
