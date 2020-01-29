//
//  ConfigurableCollectionCell.swift
//  CellKit
//
//  Created by Victor Shabanov on 30.01.2020.
//  Copyright © 2020 Victor Shabanov. All rights reserved.
//

import Foundation

public protocol ConfigurableCollectionCell {
    
    func configure(with cellModel: CollectionCellModel)
}
