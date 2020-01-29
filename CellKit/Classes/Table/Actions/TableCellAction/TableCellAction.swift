//
//  TableCellAction.swift
//  CellKit
//
//  Created by Victor Shabanov on 27.01.2020.
//  Copyright © 2020 Victor Shabanov. All rights reserved.
//

import Foundation

open class TableCellAction<T>: CellAction<TableCellModel> where T: TableCellModel {
    
    public init(_ closure: @escaping (T, IndexPath) -> Void) {
        super.init { [closure] in
            if let model = $0 as? T {
                closure(model, $1)
            }
        }
    }
}
