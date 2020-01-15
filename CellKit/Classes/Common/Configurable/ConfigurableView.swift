//
//  ConfigurableView.swift
//  CellKit
//
//  Created by Victor Shabanov on 16.01.2020.
//  Copyright © 2020 Victor Shabanov. All rights reserved.
//

import Foundation

internal protocol ConfigurableView {
    
    associatedtype ViewModelType
    
    func configure(with _: ViewModelType)
}
