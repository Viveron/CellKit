//
//  CollectionSupplyViewModel.swift
//  CellKit
//
//  Created by Victor Shabanov on 30.01.2020.
//  Copyright © 2020 Victor Shabanov. All rights reserved.
//

import Foundation

public protocol CollectionSupplyViewModel: CollectionMeasurable, Identifiable {
    
}

// MARK: - Identifiable
public extension CollectionSupplyViewModel {
    
    var id: String {
        return UUID().uuidString
    }
}
