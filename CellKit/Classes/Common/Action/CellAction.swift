//
//  CellAction.swift
//  CellKit
//
//  Created by Victor Shabanov on 27.01.2020.
//  Copyright © 2020 Victor Shabanov. All rights reserved.
//

import Foundation

open class CellAction<T> {
    
    private let closure: (T, IndexPath) -> Void
    
    public init(_ closure: @escaping (T, IndexPath) -> Void) {
        self.closure = closure
    }
    
    open func perform(with cellModel: T, at indexPath: IndexPath) {
        closure(cellModel, indexPath)
    }
}
