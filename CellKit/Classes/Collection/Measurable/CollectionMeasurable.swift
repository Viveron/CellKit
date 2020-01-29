//
//  CollectionMeasurable.swift
//  CellKit
//
//  Created by Victor Shabanov on 30.01.2020.
//  Copyright © 2020 Victor Shabanov. All rights reserved.
//

import CoreGraphics

public protocol CollectionMeasurable {
    
    var prefferedSize: CGSize? { get }
    var estimatedSize: CGSize? { get }
}

// MARK: - Default implementation
public extension CollectionMeasurable {

    var prefferedSize: CGSize? {
        return nil
    }
    
    var estimatedSize: CGSize? {
        return nil
    }
}
