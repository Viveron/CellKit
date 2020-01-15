//
//  ModelIdentifiable.swift
//  CellKit
//
//  Created by Victor Shabanov on 16.01.2020.
//  Copyright © 2020 Victor Shabanov. All rights reserved.
//

import Foundation

public protocol ModelIdentifiable {
    
    func sectionIndex(at identity: Identifiable) -> Int?
    
    func sectionHeaderIndex(at identity: Identifiable) -> Int?
    
    func sectionFooterIndex(at identity: Identifiable) -> Int?
    
    func cellIndexPath(at identity: Identifiable) -> IndexPath?
    
    func sectionIndexContainCell(at identity: Identifiable) -> Int?
    
    func sectionIndexContainHeader(at identity: Identifiable) -> Int?
    
    func sectionIndexContainFooter(at identity: Identifiable) -> Int?
}
