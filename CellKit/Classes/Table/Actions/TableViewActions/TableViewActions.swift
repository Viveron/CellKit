//
//  TableViewActions.swift
//  CellKit
//
//  Created by Victor Shabanov on 21.01.2020.
//  Copyright © 2020 Victor Shabanov. All rights reserved.
//

import UIKit

open class TableViewActions: Proxy<UITableViewDelegate>, TableActions, UITableViewDelegate {
    
    public init() {
        super.init(UITableViewDelegate.self)
    }
    
    // MARK: - UITableViewDelegate
    
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard
            let tableModel = tableView.dataSource as? TableModel,
            let cellModel = tableModel.modelForCell(at: indexPath),
            let reusable = tableModel.reusableForCell(at: indexPath) else {
            return
        }
        
        self.tableModel(tableModel, didSelect: cellModel, at: indexPath, reusable: reusable)
    }
    
    // MARK: - TableActions
    
    public func tableModel(_ tableModel: TableModel,
                           didSelect cellModel: TableCellModel,
                           at indexPath: IndexPath,
                           reusable: Reusable) {
        
    }
}

public protocol TableActions {
    
    func tableModel(_ tableModel: TableModel,
                    didSelect cellModel: TableCellModel,
                    at indexPath: IndexPath,
                    reusable: Reusable)
}
