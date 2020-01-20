//
//  UITableView+Constants.swift
//  CellKit
//
//  Created by Victor Shabanov on 16.01.2020.
//  Copyright © 2020 Victor Shabanov. All rights reserved.
//

import UIKit

public extension UITableView {
    
    static var zeroDimension: CGFloat {
        if #available(iOS 11.0, *) {
            return .leastNonzeroMagnitude
        } else {
            return 1.000001
        }
    }
}
