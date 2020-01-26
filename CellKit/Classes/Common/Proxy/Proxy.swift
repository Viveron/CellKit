//
//  Proxy.swift
//  CellKit
//
//  Created by Victor Shabanov on 21.01.2020.
//  Copyright © 2020 Victor Shabanov. All rights reserved.
//

import Foundation
import ObjectiveC.runtime

open class Proxy<T: NSObjectProtocol>: NSObject {
    
    private var targets = Set<Container<T>>()
    
    private let `protocol`: Protocol
    
    // MARK: - Interface
    
    public convenience init(_ protocol: Protocol, _ targets: T...) {
        self.init(`protocol`, targets)
    }
    
    public init(_ protocol: Protocol, _ targets: [T] = []) {
        self.protocol = `protocol`
        super.init()
        
        targets.forEach {
            add($0)
        }
    }
    
    open func add(_ target: T) {
        targets.insert(Container(target: target))
    }
    
    open func remove(_ target: T) {
        targets.remove(Container(target: target))
    }
    
    // MARK: - Forwarding methods
    
    open override func responds(to aSelector: Selector!) -> Bool {
        let target = matchingTarget(for: aSelector)
        return target != nil ? true : super.responds(to: aSelector)
    }
    
    open override func forwardingTarget(for aSelector: Selector!) -> Any? {
        let target = matchingTarget(for: aSelector)
        return target ?? super.forwardingTarget(for: aSelector)
    }
    
    // MARK: - Private methdos
    
    private func matchingTarget(for selector: Selector) -> Any? {
        return targets
            .compactMap { $0.target }
            .first(where: { availableForwarding(toTarget: $0, aSelector: selector) })
    }
    
    private func availableForwarding(toTarget target: NSObjectProtocol, aSelector selector: Selector) -> Bool {
        guard protocol_getMethodDescription(`protocol`, selector, false, true).name != nil else {
            return false
        }
        
        let method = class_getInstanceMethod(type(of: target), selector)
        let reponds = target.responds(to: selector)
        return method != nil && reponds
    }
}

// MARK: - Container
extension Proxy {
    
    internal struct Container<T: NSObjectProtocol>: Hashable {
        
        private let uuid = UUID()
        
        public private(set) weak var target: T?
        
        // MARK: - Hashable
        
        public func hash(into hasher: inout Hasher) {
            hasher.combine(uuid)
        }
        
        // MARK: - Equatable
        
        public static func == (lhs: Container<T>, rhs: Container<T>) -> Bool {
            guard let ltarget = lhs.target, let rtarget = rhs.target else {
                return lhs.target == nil && rhs.target == nil
            }
            return ltarget.isEqual(rtarget)
        }
    }
}
