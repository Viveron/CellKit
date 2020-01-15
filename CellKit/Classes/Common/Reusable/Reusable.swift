//
//  Reusable.swift
//  CellKit
//
//  Created by Victor Shabanov on 16.01.2020.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation

public protocol Reusable {
    
    var reuseClass: AnyClass { get }
    var reuseIdentifier: String { get }
}

// MARK: - Default implementation
public extension Reusable {
    
    var reuseIdentifier: String {
        return String(describing: reuseClass)
    }
}
