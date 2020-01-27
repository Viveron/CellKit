//
//  TableViewSupplyView.swift
//  CellKit
//
//  Created by Victor Shabanov on 26.01.2020.
//

import UIKit

open class TableViewSupplyView<ModelType>: UITableViewHeaderFooterView, ConfigurableTableSupplyView where ModelType: TableSupplyViewModel {
    
    // MARK: - Configurable
    
    open func configure(with viewModel: ModelType) {
        // empty for subclasses overriding
    }
}

// MARK: - ConfigurableView
extension TableViewSupplyView: ConfigurableView {
    
    // Configuration method for common use
    public func configure(with viewModel: TableSupplyViewModel) {
        if let viewModel = viewModel as? ModelType {
            configure(with: viewModel)
        }
    }
}
