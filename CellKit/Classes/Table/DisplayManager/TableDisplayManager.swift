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
    
    public init(model: TableViewModel = .init(),
                actions: TableViewActions = .init()) {
        
        self.model = model
        self.actions = actions
        
        actions.add(model)
    }
    
    open func configureTableView() {
        guard let tableView = tableView else {
            return
        }
        
        tableView.dataSource = model
        tableView.delegate = actions
        
        // Avoid empty rows for empty model state
        if tableView.tableFooterView == nil {
            tableView.tableFooterView = UIView()
        }
    }
    
    // MARK: - TableSectionObject mutations
    
    open func append(sectionObject: TableSectionObject,
                     with animation: UITableView.RowAnimation = .none) {
        
        append(sectionObjects: [sectionObject], with: animation)
    }
    
    open func append(sectionObjects: [TableSectionObject],
                     with animation: UITableView.RowAnimation = .none) {
        
        let indexes = model.append(sectionObjects: sectionObjects)
        tableView?.insertSections(IndexSet(indexes), with: animation)
    }
    
    open func insert(sectionObject: TableSectionObject,
                     at index: Int,
                     with animation: UITableView.RowAnimation = .none) {
        
        insert(sectionObjects: [sectionObject], at: index, with: animation)
    }
    
    open func insert(sectionObjects: [TableSectionObject],
                     at index: Int,
                     with animation: UITableView.RowAnimation = .none)  {
        
        let indexes = model.insert(sectionObjects: sectionObjects, at: index)
        tableView?.insertSections(IndexSet(indexes), with: animation)
    }
    
    open func remove(sectionObjectAt index: Int,
                     with animation: UITableView.RowAnimation = .none) {
        
        let index = model.remove(sectionObjectAt: index)
        tableView?.deleteSections(IndexSet([index]), with: animation)
    }
    
    // MARK: - TableCellObject mutations
    
    open func append(cellObject: TableCellObject,
                     with animation: UITableView.RowAnimation = .none) {
        
        append(cellObjects: [cellObject], with: animation)
    }
    
    open func append(cellObjects: [TableCellObject],
                     with animation: UITableView.RowAnimation = .none) {
        
        let indexPaths = model.append(cellObjects: cellObjects)
        tableView?.insertRows(at: indexPaths, with: animation)
    }
    
    open func append(cellObject: TableCellObject,
                     toSection index: Int,
                     with animation: UITableView.RowAnimation = .none) {
        
        append(cellObjects: [cellObject], toSection: index, with: animation)
    }
    
    open func append(cellObjects: [TableCellObject],
                     toSection index: Int,
                     with animation: UITableView.RowAnimation = .none) {
        
        let indexPaths = model.append(cellObjects: cellObjects, toSection: index)
        tableView?.insertRows(at: indexPaths, with: animation)
    }
    
    open func insert(cellObject: TableCellObject,
                     at indexPath: IndexPath,
                     with animation: UITableView.RowAnimation = .none) {
        
        insert(cellObjects: [cellObject], at: indexPath, with: animation)
    }
    
    open func insert(cellObjects: [TableCellObject],
                     at indexPath: IndexPath,
                     with animation: UITableView.RowAnimation = .none) {
        
        let indexPaths = model.insert(cellObjects: cellObjects, at: indexPath)
        tableView?.insertRows(at: indexPaths, with: animation)
    }
    
    open func remove(cellObjectAt indexPath: IndexPath,
                     with animation: UITableView.RowAnimation = .none) {
        
        let indexPath = model.remove(cellObjectAt: indexPath)
        tableView?.deleteRows(at: [indexPath], with: animation)
    }
}
