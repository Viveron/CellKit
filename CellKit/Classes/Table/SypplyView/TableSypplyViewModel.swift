//
//  TableSypplyViewModel.swift
//  CellKit
//
//  Created by Victor Shabanov on 16.01.2020.
//  Copyright © 2020 Victor Shabanov. All rights reserved.
//

import UIKit

public protocol TableSypplyViewModel: TableMeasurable, Identifiable {
    
}

// MARK: - Identifiable
public extension TableSypplyViewModel {
    
    var id: String {
        return UUID().uuidString
    }
}

// MARK: - TableMeasurable
public extension TableSypplyViewModel {
    
    var prefferedHeight: CGFloat? {
        return UITableView.zeroDimension
    }
}
