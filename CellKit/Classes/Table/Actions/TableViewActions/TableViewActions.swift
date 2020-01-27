//
//  TableViewActions.swift
//  CellKit
//
//  Created by Victor Shabanov on 21.01.2020.
//  Copyright © 2020 Victor Shabanov. All rights reserved.
//

import UIKit

open class TableViewActions: Proxy<UITableViewDelegate>, UITableViewDelegate {
    
    public init() {
        super.init(UITableViewDelegate.self)
    }
    
    private var tapActions: [String: CellAction<TableCellModel>] = [:]
    
    open func attach<T: TableCellObject>(to cellObjectCalss: T.Type, tapAction: CellAction<TableCellModel>?) {
        if let `class` = cellObjectCalss as? AnyClass {
            tapActions[NSStringFromClass(`class`)] = tapAction
        }
    }
    
    // MARK: - UITableViewDelegate
    
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let tableModel = tableView.dataSource as? TableModel,
              let cellModel = tableModel.modelForCell(at: indexPath),
              let reusable = tableModel.reusableForCell(at: indexPath) else {
            return
        }
        
        if let `class` = type(of: reusable) as? AnyClass {
            tapActions[NSStringFromClass(`class`)]?.perform(with: cellModel, at: indexPath)
        }
    }
}
