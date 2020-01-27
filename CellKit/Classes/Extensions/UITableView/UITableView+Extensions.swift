//
//  UITableView+Extensions.swift
//  CellKit
//
//  Created by Victor Shabanov on 21.01.2020.
//  Copyright © 2020 Victor Shabanov. All rights reserved.
//

import UIKit

public extension UITableView {
    
    // MARK: - Reusable
    
    @discardableResult
    func registerCell(_ reusable: Reusable) -> String {
        register(reusable.reuseClass, forCellReuseIdentifier: reusable.reuseIdentifier)
        return reusable.reuseIdentifier
    }
    
    @discardableResult
    func registerSupplyView(_ reusable: Reusable) -> String {
        register(reusable.reuseClass, forHeaderFooterViewReuseIdentifier: reusable.reuseIdentifier)
        return reusable.reuseIdentifier
    }
}
