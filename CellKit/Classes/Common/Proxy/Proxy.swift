//
//  Proxy.swift
//  CellKit
//
//  Created by Victor Shabanov on 21.01.2020.
//  Copyright © 2020 Victor Shabanov. All rights reserved.
//

import Foundation

open class Proxy: NSObject {
    
    private let targets: NSMutableSet
    
    public convenience init(_ targets: NSObjectProtocol...) {
        self.init(targets)
    }
    
    public convenience init(_ target: NSObjectProtocol) {
        self.init([target])
    }
    
    public init(_ targets: [NSObjectProtocol] = []) {
        self.targets = NSMutableSet(array: targets)
        super.init()
    }
    
    open func add(_ target: NSObjectProtocol) {
        targets.add(target)
    }
    
    open func remove(_ target: NSObjectProtocol) {
        targets.remove(target)
    }
    
    // MARK: - Forwarding methods
    
    open override func forwardingTarget(for aSelector: Selector!) -> Any? {
        return targets.first(where: { ($0 as! NSObjectProtocol).responds(to: aSelector) })
    }
}
