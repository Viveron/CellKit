//
//  TableViewCellObject.swift
//  CellKit
//
//  Created by Victor Shabanov on 16.01.2020.
//  Copyright © 2020 Victor Shabanov. All rights reserved.
//

import Foundation

public class TableViewCellObject<CellType, ModelType>: TableCellObject where CellType: TableViewCell<ModelType> {
    
    public var reuseClass: AnyClass {
        return CellType.self
    }
    
    public var cellModel: TableCellModel {
        return model
    }
    
    // Object' specific model
    public let model: ModelType
    
    public required init(model: ModelType) {
        self.model = model
    }
}
