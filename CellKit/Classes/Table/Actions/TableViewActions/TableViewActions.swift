//
//  TableViewActions.swift
//  CellKit
//
//  Created by Victor Shabanov on 21.01.2020.
//  Copyright © 2020 Victor Shabanov. All rights reserved.
//

import UIKit

open class TableViewActions: NSObject, UITableViewDelegate {
    
    private let proxy = Proxy()
    
    init(_ original: UITableViewDelegate? = nil) {
        super.init()
        
        if let target = original {
            proxy.add(target)
        }
    }
    
    // MARK: - UITableViewDelegate
    
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard
            let tableModel = tableView.dataSource as? TableModel,
            let cellModel = tableModel.modelForCell(at: indexPath),
            let reusable = tableModel.reusableForCell(at: indexPath) else {
            return
        }
        
    }
}
