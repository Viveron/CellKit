//
//  CollectionCellObject.swift
//  CellKit
//
//  Created by Victor Shabanov on 30.01.2020.
//  Copyright © 2020 Victor Shabanov. All rights reserved.
//

import Foundation

// Object which describes cell representation, model and measure
public protocol CollectionCellObject: Reusable, Identifiable {
    
    var cellModel: CollectionCellModel { get }
}

// MARK: - Identifiable
public extension CollectionCellObject {
    
    var id: String {
        return cellModel.id
    }
    
    var hash: Int {
        return cellModel.hash
    }
}
