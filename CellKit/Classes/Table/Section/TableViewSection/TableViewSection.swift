//
//  TableViewSection.swift
//  CellKit
//
//  Created by Victor Shabanov on 16.01.2020.
//  Copyright © 2020 Victor Shabanov. All rights reserved.
//

import Foundation

public struct TableViewSection: TableSectionObject, Hashable {
    
    // MARK: - Identifiable
    
    public let id: String
    
    // MARK: - TableSectionObject
    
    public let headerObject: TableSypplyViewObject?
    public let footerObject: TableSypplyViewObject?
    public let cellObjects: [TableCellObject]
    
    public init(id: String = UUID().uuidString,
                headerObject: TableSypplyViewObject? = nil,
                footerObject: TableSypplyViewObject? = nil,
                cellObjects: [TableCellObject] = []) {
        
        self.id = id
        self.headerObject = headerObject
        self.footerObject = footerObject
        self.cellObjects = cellObjects
    }
    
    // MARK: - Hashable
    
    public func hash(into hasher: inout Hasher) {
        if let value = headerObject?.id {
            hasher.combine(value)
        }
        if let value = footerObject?.id {
            hasher.combine(value)
        }
        cellObjects.forEach {
            hasher.combine($0.id)
        }
    }
}
