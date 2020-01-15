//
//  TableCellObject.swift
//  CellKit
//
//  Created by Victor Shabanov on 16.01.2020.
//  Copyright © 2020 Victor Shabanov. All rights reserved.
//

import Foundation

// Object which describes cell representation, model and measure
public protocol TableCellObject: Reusable, Identifiable {
    
    var cellModel: TableCellModel { get }
}

// MARK: - Identifiable
public extension TableCellObject {
    
    var id: String {
        return cellModel.id
    }
    
    var hash: Int {
        return cellModel.hash
    }
}
