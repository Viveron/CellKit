//
//  TableViewCell.swift
//  CellKit
//
//  Created by Victor Shabanov on 16.01.2020.
//  Copyright © 2020 Victor Shabanov. All rights reserved.
//

import UIKit

open class TableViewCell<ModelType>: UITableViewCell, ConfigurableTableCell where ModelType: TableCellModel {
    
    // MARK: - Configurable
    
    open func configure(with cellModel: ModelType) {
        // empty for subclasses overriding
    }
}

// MARK: - ConfigurableView
extension TableViewCell: ConfigurableView {
    
    // Configuration method for common use
    public func configure(with cellModel: TableCellModel) {
        if let cellModel = cellModel as? ModelType {
            configure(with: cellModel)
        }
    }
}
