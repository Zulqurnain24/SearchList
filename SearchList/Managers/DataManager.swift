//
//  DataManager.swift
//  SearchList
//
//  Created by Mohammad Zulqurnain on 26/01/2022.
//

import Foundation

class DataManager {

    func getListItemsFrom<T: Codable>(fileName: String, completed: @escaping (Result<T, ErrorMessage>) -> Void) {

        if let path = Bundle.main.path(forResource: fileName, ofType: StringConstants.stubFileType.rawValue) {
            do {
                let decoder = JSONDecoder()
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let listItemList = try decoder.decode(T.self, from: data)
                completed(.success(listItemList))
              } catch {
                completed(.failure(.invalidData))
              }
        }
    }
}
