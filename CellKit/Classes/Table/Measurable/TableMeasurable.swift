//
//  TableMeasurable.swift
//  CellKit
//
//  Created by Victor Shabanov on 16.01.2020.
//  Copyright © 2020 Victor Shabanov. All rights reserved.
//

import CoreGraphics

public protocol TableMeasurable {
    
    var prefferedHeight: CGFloat? { get }
    var estimatedHeight: CGFloat? { get }
}

// MARK: - Default implementation
public extension TableMeasurable {

    var prefferedHeight: CGFloat? {
        return nil
    }
    
    var estimatedHeight: CGFloat? {
        return nil
    }
}
