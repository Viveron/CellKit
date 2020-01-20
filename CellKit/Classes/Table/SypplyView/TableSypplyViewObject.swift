//
//  TableSypplyViewObject.swift
//  CellKit
//
//  Created by Victor Shabanov on 16.01.2020.
//  Copyright © 2020 Victor Shabanov. All rights reserved.
//

import Foundation

// Object which describes header or footer view of table's section
public protocol TableSypplyViewObject: Reusable, Identifiable {
    
    var viewModel: TableSypplyViewModel { get }
}

// MARK: - Identifiable
public extension TableSypplyViewObject {
    
    var id: String {
        return viewModel.id
    }
    
    var hash: Int {
        return viewModel.hash
    }
}
