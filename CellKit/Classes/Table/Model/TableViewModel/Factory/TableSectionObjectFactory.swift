//
//  TableSectionObjectFactory.swift
//  CellKit
//
//  Created by Victor Shabanov on 16.01.2020.
//  Copyright © 2020 Victor Shabanov. All rights reserved.
//

import Foundation

public class TableSectionObjectFactory {
    
    public func makeSectionObject(id: String = UUID().uuidString,
                                  headerObject: TableSupplyViewObject? = nil,
                                  footerObject: TableSupplyViewObject? = nil,
                                  cellObjects: [TableCellObject] = []) -> TableSectionObject {
        
        return TableViewSection(id: id,
                                headerObject: headerObject,
                                footerObject: footerObject,
                                cellObjects: cellObjects)
    }
    
    // MARK: - Changes of object
    
    public func change(in sectionObject: TableSectionObject,
                       headerObject: TableSupplyViewObject? = nil) -> TableSectionObject {
        
        return TableViewSection(id: sectionObject.id,
                                headerObject: headerObject,
                                footerObject: sectionObject.footerObject,
                                cellObjects: sectionObject.cellObjects)
    }
    
    public func change(in sectionObject: TableSectionObject,
                       footerObject: TableSupplyViewObject? = nil) -> TableSectionObject {
        
        return TableViewSection(id: sectionObject.id,
                                headerObject: sectionObject.headerObject,
                                footerObject: footerObject,
                                cellObjects: sectionObject.cellObjects)
    }
    
    public func change(in sectionObject: TableSectionObject,
                       cellObjects: [TableCellObject] = []) -> TableSectionObject {
        
        return TableViewSection(id: sectionObject.id,
                                headerObject: sectionObject.headerObject,
                                footerObject: sectionObject.footerObject,
                                cellObjects: cellObjects)
    }
}
