//
//  TableDisplayManager.swift
//  CellKit
//
//  Created by Victor Shabanov on 20.01.2020.
//  Copyright © 2020 Victor Shabanov. All rights reserved.
//

import UIKit

open class TableDisplayManager {
    
    open private(set) var model: TableViewModel
    open private(set) var actions: TableViewActions
    
    open var tableView: UITableView? {
        didSet {
            configureTableView()
        }
    }
    
    public init(_ tableView: UITableView? = nil) {
        self.model = TableViewModel()
        self.actions = TableViewActions()
        self.tableView = tableView
        
        actions.add(model)
        configureTableView()
    }
    
    open func configureTableView() {
        guard let tableView = tableView else {
            return
        }
        
        tableView.dataSource = model
        tableView.delegate = actions
    }
}
