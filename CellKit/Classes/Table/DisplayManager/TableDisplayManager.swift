//
//  TableDisplayManager.swift
//  CellKit
//
//  Created by Victor Shabanov on 20.01.2020.
//  Copyright © 2020 Victor Shabanov. All rights reserved.
//

import UIKit

public class TableDisplayManager {
    
    public private(set) var model: TableViewModel
    public private(set) var actions: TableViewActions
    
    public var tableView: UITableView? {
        didSet {
            configureTableView()
        }
    }
    
    public init(_ tableView: UITableView? = nil) {
        self.model = TableViewModel()
        self.actions = TableViewActions(model)
        self.tableView = tableView
        configureTableView()
    }
    
    public func configureTableView() {
        guard let tableView = tableView else {
            return
        }
        
        tableView.dataSource = model
        tableView.delegate = model
    }
    
    // MARK: - Private methods
}
