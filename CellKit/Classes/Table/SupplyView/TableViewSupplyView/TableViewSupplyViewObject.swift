//
//  TableViewSupplyViewObject.swift
//  CellKit
//
//  Created by Victor Shabanov on 26.01.2020.
//

import Foundation

open class TableViewSupplyViewObject<ViewType, ModelType>: TableSupplyViewObject where ViewType: TableViewSupplyView<ModelType> {
    
    public var reuseClass: AnyClass {
        return ViewType.self
    }
    
    public var viewModel: TableSupplyViewModel {
        return model
    }
    
    // Object' specific model
    public let model: ModelType
    
    public required init(model: ModelType) {
        self.model = model
    }
}
