//
//  TableModel.swift
//  CellKit
//
//  Created by Victor Shabanov on 16.01.2020.
//  Copyright © 2020 Victor Shabanov. All rights reserved.
//

import UIKit

public protocol TableModel: TableModelRepresentable {
    
    var sections: [TableSectionObject] { get }
}

public extension TableModel {
    
    // MARK: - ModelRepresentable
    
    func numberOfSections() -> Int {
        return sections.count
    }
    
    func numberOfCellsInSection(at index: Int) -> Int {
        return sectionObject(at: index)?.cellObjects.count ?? 0
    }
    
    func reusableForSectionHeader(at index: Int) -> Reusable? {
        return sectionObject(at: index)?.headerObject
    }
    
    func reusableForSectionFooter(at index: Int) -> Reusable? {
        return sectionObject(at: index)?.footerObject
    }
    
    func reusableForCell(at indexPath: IndexPath) -> Reusable? {
        return cellObject(at: indexPath)
    }
    
    // MARK: - ModelIdentifiable
    
    func sectionIndex(at identity: Identifiable) -> Int? {
        return sections.firstIndex { $0.id == identity.id }
    }
    
    func sectionHeaderIndex(at identity: Identifiable) -> Int? {
        return sections.firstIndex { $0.headerObject?.id == identity.id }
    }
    
    func sectionFooterIndex(at identity: Identifiable) -> Int? {
        return sections.firstIndex { $0.footerObject?.id == identity.id }
    }
    
    func cellIndexPath(at identity: Identifiable) -> IndexPath? {
        var section: Int?
        var row: Int?
        
        section = sections.firstIndex { sectionObject -> Bool in
            row = sectionObject.cellObjects.firstIndex { cellObject -> Bool in
                cellObject.id == identity.id
            }
            return row != nil
        }
        
        if let section = section, let row = row {
            return IndexPath(row: row, section: section)
        } else {
            return nil
        }
    }
    
    func sectionIndexContainCell(at identity: Identifiable) -> Int? {
        return sections.firstIndex { sectionObject -> Bool in
            sectionObject.cellObjects.firstIndex { cellObject -> Bool in
                cellObject.id == identity.id
            } != nil
        }
    }
    
    func sectionIndexContainHeader(at identity: Identifiable) -> Int? {
        return sections.firstIndex { $0.headerObject?.id == identity.id }
    }
    
    func sectionIndexContainFooter(at identity: Identifiable) -> Int? {
        return sections.firstIndex { $0.footerObject?.id == identity.id }
    }
    
    // MARK: - TableModelRepresentable
    
    func modelForSectionHeader(at index: Int) -> TableSupplyViewModel? {
        return sectionObject(at: index)?.headerObject?.viewModel
    }
    
    func modelForSectionFooter(at index: Int) -> TableSupplyViewModel? {
        return sectionObject(at: index)?.footerObject?.viewModel
    }
    
    func modelForCell(at indexPath: IndexPath) -> TableCellModel? {
        return cellObject(at: indexPath)?.cellModel
    }
    
    // MARK: - Helpers
    
    private func sectionObject(at index: Int) -> TableSectionObject? {
        return isSection(index) ? sections[index] : nil
    }
    
    private func cellObject(at indexPath: IndexPath) -> TableCellObject? {
        return isCell(indexPath) ? sections[indexPath.section].cellObjects[indexPath.row] : nil
    }
    
    private func isSection(_ index: Int) -> Bool {
        return index >= 0
            && index < sections.count
    }
    
    private func isCell(_ indexPath: IndexPath) -> Bool {
        return isSection(indexPath.section)
            && indexPath.row >= 0
            && indexPath.row < sections[indexPath.section].cellObjects.count
    }
}
