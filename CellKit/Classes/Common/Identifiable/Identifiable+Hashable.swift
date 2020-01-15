//
//  Identifiable+Hashable.swift
//  CellKit
//
//  Created by Victor Shabanov on 16.01.2020.
//  Copyright © 2020 Victor Shabanov. All rights reserved.
//

import Foundation

public extension Identifiable where Self: Hashable {
    
    var hash: Int {
        return hashValue
    }
}

public extension Equatable where Self: Identifiable {
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}
