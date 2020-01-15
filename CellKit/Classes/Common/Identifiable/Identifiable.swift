//
//  Identifiable.swift
//  CellKit
//
//  Created by Victor Shabanov on 16.01.2020.
//  Copyright © 2020 Victor Shabanov. All rights reserved.
//

import Foundation

public protocol Identifiable {
    
    var id: String { get }
    
    /// Hash value of object's content
    var hash: Int { get }
}

// MARK: - Default implementations
public extension Identifiable {
    
    var hash: Int {
        return .zero
    }
}
