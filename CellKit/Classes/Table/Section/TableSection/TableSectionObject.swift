//
//  TableSectionObject.swift
//  CellKit
//
//  Created by Victor Shabanov on 16.01.2020.
//  Copyright © 2020 Victor Shabanov. All rights reserved.
//

import Foundation

// Object which describes section representation
public protocol TableSectionObject: Identifiable {
    
    var headerObject: TableSupplyViewObject? { get }
    var footerObject: TableSupplyViewObject? { get }
    var cellObjects: [TableCellObject] { get }
}
