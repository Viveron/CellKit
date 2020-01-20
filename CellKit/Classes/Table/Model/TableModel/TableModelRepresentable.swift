//
//  TableModel+Implementstion.swift
//  CellKit
//
//  Created by Victor Shabanov on 16.01.2020.
//  Copyright © 2020 Victor Shabanov. All rights reserved.
//

import UIKit

public protocol TableModelRepresentable: ModelRepresentable, ModelIdentifiable {
    
    func modelForSectionHeader(at index: Int) -> TableSypplyViewModel?

    func modelForSectionFooter(at index: Int) -> TableSypplyViewModel?
    
    func modelForCell(at indexPath: IndexPath) -> TableCellModel?
}
