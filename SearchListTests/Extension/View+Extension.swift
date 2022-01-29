//
//  View+Extension.swift
//  SearchListTests
//
//  Created by Mohammad Zulqurnain on 29/01/2022.
//

import UIKit

extension UIViewController {
    func simulateLifeCycle() {
        self.viewDidLoad()
        self.viewWillAppear(true)
        self.viewDidAppear(true)
    }
}
