//
//  TableSupplyViewObject.swift
//  CellKit
//
//  Created by Victor Shabanov on 16.01.2020.
//  Copyright © 2020 Victor Shabanov. All rights reserved.
//

import Foundation

// Object which describes header or footer view of table's section
public protocol TableSupplyViewObject: Reusable, Identifiable {
    
    var viewModel: TableSupplyViewModel { get }
}

// MARK: - Identifiable
public extension TableSupplyViewObject {
    
    var id: String {
        return viewModel.id
    }
    
    var hash: Int {
        return viewModel.hash
    }
}
