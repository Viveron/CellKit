//
//  TableSupplyViewModel.swift
//  CellKit
//
//  Created by Victor Shabanov on 16.01.2020.
//  Copyright © 2020 Victor Shabanov. All rights reserved.
//

import UIKit

public protocol TableSupplyViewModel: TableMeasurable, Identifiable {
    
}

// MARK: - Identifiable
public extension TableSupplyViewModel {
    
    var id: String {
        return UUID().uuidString
    }
}

// MARK: - TableMeasurable
public extension TableSupplyViewModel {
    
    var estimatedHeight: CGFloat? {
        return UITableView.zeroDimension
    }
}
