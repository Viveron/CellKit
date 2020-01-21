//
//  TableViewModel.swift
//  CellKit
//
//  Created by Victor Shabanov on 16.01.2020.
//  Copyright © 2020 Victor Shabanov. All rights reserved.
//

import UIKit

open class TableViewModel: NSObject, TableModel, UITableViewDataSource, UITableViewDelegate {
    
    open private(set) var sections: [TableSectionObject]
    
    open var factory: TableSectionObjectFactory
    
    // MARK: - Initializers
    
    public convenience init(_ sections: TableSectionObject...) {
        self.init(sections)
    }
    
    public convenience init(_ section: TableSectionObject) {
        self.init([section])
    }
    
    public init(_ sections: [TableSectionObject] = []) {
        self.sections = sections
        self.factory = .init()
        super.init()
    }
    
    // MARK: - UITableViewDataSource
    
    open func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections()
    }
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfCellsInSection(at: section)
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIdentifier: String
        if let reusable = reusableForCell(at: indexPath) {
            reuseIdentifier = tableView.registerCell(reusable)
        } else {
            reuseIdentifier = UITableViewCell.unavailableReuseIdentifier
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        if let configurable = cell as? ConfigurableTableCell, let model = modelForCell(at: indexPath) {
            configurable.configure(with: model)
        }
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let reusable = reusableForSectionHeader(at: section) else {
            return nil
        }
        let reuseIdentifier = tableView.registerSupplyView(reusable)
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: reuseIdentifier)
        if let configurable = view as? ConfigurableTableSupplyView, let model = modelForSectionHeader(at: section) {
            configurable.configure(with: model)
        }
        
        return view
    }
    
    open func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let reusable = reusableForSectionFooter(at: section) else {
            return nil
        }
        let reuseIdentifier = tableView.registerSupplyView(reusable)
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: reuseIdentifier)
        if let configurable = view as? ConfigurableTableSupplyView, let model = modelForSectionFooter(at: section) {
            configurable.configure(with: model)
        }
        
        return view
    }
    
    open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableView(tableView, estimatedHeightForRowAt: indexPath)
    }

    open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.tableView(tableView, estimatedHeightForHeaderInSection: section)
    }

    open func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return self.tableView(tableView, estimatedHeightForFooterInSection: section)
    }

    open func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return height(modelForCell(at: indexPath), defaultValue: tableView.estimatedRowHeight)
    }

    open func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return height(modelForSectionHeader(at: section), defaultValue: tableView.estimatedSectionHeaderHeight)
    }

    open func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return height(modelForSectionFooter(at: section), defaultValue: tableView.estimatedSectionFooterHeight)
    }
    
    // MARK: - TableSectionObject mutations
    
    @discardableResult
    open func append(sectionObject: TableSectionObject) -> Int {
        return append(sectionObjects: [sectionObject]).first!
    }
    
    @discardableResult
    open func append(sectionObjects: [TableSectionObject]) -> [Int] {
        let count = sections.count - 1
        sections.append(contentsOf: sectionObjects)
        return Array(count..<sections.count)
    }
    
    @discardableResult
    open func insert(sectionObject: TableSectionObject, at index: Int) -> Int {
        return insert(sectionObjects: [sectionObject], at: index).first!
    }
    
    @discardableResult
    open func insert(sectionObjects: [TableSectionObject], at index: Int) -> [Int] {
        let section = normalize(index, in: 0..<sections.count)
        sections.insert(contentsOf: sectionObjects, at: section)
        return Array(section..<(section + sectionObjects.count))
    }
    
    // MARK: - TableCellObject mutations
    
    @discardableResult
    open func append(cellObject: TableCellObject) -> IndexPath {
        return append(cellObjects: [cellObject]).first!
    }
    
    @discardableResult
    open func append(cellObjects: [TableCellObject]) -> [IndexPath] {
        let section: TableSectionObject
        let row: Int
        
        if let object = sections.last {
            row = object.cellObjects.count
            section = factory.change(in: object,
                                     cellObjects: object.cellObjects + cellObjects)
        } else {
            row = 0
            section = factory.makeSectionObject(cellObjects: cellObjects)
        }
        sections.append(section)
        
        return (0..<cellObjects.count).map {
            IndexPath(row: row + $0,
                      section: sections.count - 1)
        }
    }
    
    @discardableResult
    open func append(cellObject: TableCellObject, toSection index: Int) -> IndexPath {
        return append(cellObjects: [cellObject], toSection: index).first!
    }
    
    @discardableResult
    open func append(cellObjects: [TableCellObject], toSection index: Int) -> [IndexPath] {
        let object = sections[index]
        let row = object.cellObjects.count
        
        sections[index] = factory.change(in: object,
                                         cellObjects: object.cellObjects + cellObjects)
        
        return (0..<cellObjects.count).map {
            IndexPath(row: row + $0,
                      section: index)
        }
    }
    
    @discardableResult
    open func insert(cellObject: TableCellObject, at indexPath: IndexPath) -> IndexPath {
        return insert(cellObjects: [cellObject], at: indexPath).first!
    }
    
    @discardableResult
    open func insert(cellObjects: [TableCellObject], at indexPath: IndexPath) -> [IndexPath] {
        let object = sections[indexPath.section]
        let row = normalize(indexPath.row, in: 0..<object.cellObjects.count)
        
        var cells = object.cellObjects
        cells.insert(contentsOf: cellObjects, at: row)
        
        sections[indexPath.section] = factory.change(in: object,
                                                     cellObjects: cells)
        
        return (0..<cellObjects.count).map {
            IndexPath(row: row + $0,
                      section: indexPath.section)
        }
    }
    
    // MARK: - Heplpers
    
    private func normalize<T>(_ value: T, in range: Range<T>) -> T {
        guard !range.contains(value) else {
            return value
        }
        return value < range.lowerBound ? range.lowerBound : range.upperBound
    }
    
    private func height(_ measurable: TableMeasurable?,
                        defaultValue: CGFloat = UITableView.automaticDimension) -> CGFloat {
        return measurable?.prefferedHeight
            ?? measurable?.estimatedHeight
            ?? defaultValue
    }
}
