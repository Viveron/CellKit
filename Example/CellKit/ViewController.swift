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
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        displayManager.tableView = tableView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        displayManager.reload(witn: 5, title: "It's works!")
    }
}

class DisplayManager: TableDisplayManager {
    
    func reload(witn numberOfCells: Int, title: String) {
        let cellObjcts = (0..<numberOfCells).map { _ in
            InfoTableViewCellObject(model: .init())
        }
        
        let headerObject = InfoSupplyViewObject(model: .init(title: title))
        let sectionObject = TableViewSection(headerObject: headerObject)
        
        append(sectionObject: sectionObject, with: .left)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.append(cellObjects: cellObjcts, with: .right)
        }
        
        let action = TableCellAction<InfoTableViewCellModel> { model, IndexPath in
            self.remove(cellObjectAt: IndexPath)
        }
        
        actions.attach(to: InfoTableViewCellObject.self, tapAction: action)
    }
}

typealias InfoTableViewCellObject = TableViewCellObject<InfoTableViewCell, InfoTableViewCellModel>

class InfoTableViewCellModel: TableCellModel {
    
    let id: String = UUID().uuidString
}

class InfoTableViewCell: TableViewCell<InfoTableViewCellModel> {
    
    private let titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
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

typealias InfoSupplyViewObject = TableViewSupplyViewObject<InfoSupplyView, InfoSupplyViewModel>

class InfoSupplyViewModel: TableSupplyViewModel {
    
    let title: String?
    
    init(title: String? = nil) {
        self.title = title
    }
}

class InfoSupplyView: TableViewSupplyView<InfoSupplyViewModel> {
    
    private let titleLabel = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        titleLabel.numberOfLines = 0
        
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func configure(with viewModel: InfoSupplyViewModel) {
        super.configure(with: viewModel)
        
        titleLabel.text = viewModel.title ?? "empty"
    }
}
