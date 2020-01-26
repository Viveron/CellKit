//
//  ViewController.swift
//  CellKit
//
//  Created by viveron on 01/15/2020.
//  Copyright (c) 2020 viveron. All rights reserved.
//

import UIKit
import CellKit

class ViewController: UIViewController {

    let tableView = UITableView()
    let displayManager = DisplayManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        displayManager.tableView = tableView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        displayManager.reload(witn: 5)
    }
}

class DisplayManager: TableDisplayManager {
    
    func reload(witn numberOfCells: Int) {
        let cellObjcts = (0..<numberOfCells).map { _ in
            InfoTableViewCellObject(model: .init())
        }
        
        model.append(cellObjects: cellObjcts)
        tableView?.reloadData()
    }
}

typealias InfoTableViewCellObject = TableViewCellObject<InfoTableViewCell, InfoTableViewCellModel>

class InfoTableViewCellModel: TableCellModel {
    
    let id: String = UUID().uuidString
}

class InfoTableViewCell: TableViewCell<InfoTableViewCellModel> {
    
    private let titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        titleLabel.numberOfLines = 0
        
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 50).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -50).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50).isActive = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Configurable
    
    override func configure(with cellModel: InfoTableViewCellModel) {
        super.configure(with: cellModel)
        
        titleLabel.text = cellModel.id
    }
}
