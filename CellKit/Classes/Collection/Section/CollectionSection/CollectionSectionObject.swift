//
//  CollectionSectionObject.swift
//  CellKit
//
//  Created by Victor Shabanov on 30.01.2020.
//  Copyright © 2020 Victor Shabanov. All rights reserved.
//

import Foundation

// Object which describes section representation
public protocol CollectionSectionObject: Identifiable {
    
    var headerObject: CollectionSupplyViewObject? { get }
    var footerObject: CollectionSupplyViewObject? { get }
    var cellObjects: [CollectionCellObject] { get }
}
