//
//  CollectionSupplyViewObject.swift
//  CellKit
//
//  Created by Victor Shabanov on 30.01.2020.
//  Copyright © 2020 Victor Shabanov. All rights reserved.
//

import Foundation

// Object which describes header or footer view of collection's section
public protocol CollectionSupplyViewObject: Reusable, Identifiable {
    
    var viewModel: CollectionSupplyViewModel { get }
}

// MARK: - Identifiable
public extension CollectionSupplyViewObject {
    
    var id: String {
        return viewModel.id
    }
    
    var hash: Int {
        return viewModel.hash
    }
}
