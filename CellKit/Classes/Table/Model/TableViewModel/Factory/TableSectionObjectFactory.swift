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
                                  headerObject: TableSypplyViewObject? = nil,
                                  footerObject: TableSypplyViewObject? = nil,
                                  cellObjects: [TableCellObject] = []) -> TableSectionObject {
        
        return TableViewSection(id: id,
                                headerObject: headerObject,
                                footerObject: footerObject,
                                cellObjects: cellObjects)
    }
    
    public func change(in sectionObject: TableSectionObject,
                       headerObject: TableSypplyViewObject? = nil,
                       footerObject: TableSypplyViewObject? = nil,
                       cellObjects: [TableCellObject]? = nil) -> TableSectionObject {
        
        return TableViewSection(id: sectionObject.id,
                                headerObject: headerObject ?? sectionObject.headerObject,
                                footerObject: footerObject ?? sectionObject.footerObject,
                                cellObjects: cellObjects ?? sectionObject.cellObjects)
    }
}
