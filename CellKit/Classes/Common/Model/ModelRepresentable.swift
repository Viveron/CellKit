//
//  ModelRepresentable.swift
//  CellKit
//
//  Created by Victor Shabanov on 16.01.2020.
//  Copyright © 2020 Victor Shabanov. All rights reserved.
//

import Foundation

public protocol ModelRepresentable {
    
    func numberOfSections() -> Int

    func numberOfCellsInSection(at index: Int) -> Int
    
    func reuseIdentifierForSectionHeader(at index: Int) -> String?
    
    func reuseIdentifierForSectionFooter(at index: Int) -> String?
    
    func reuseIdentifierForCell(at indexPath: IndexPath) -> String
}
