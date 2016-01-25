//
//  NSObject+Utils.swift
//  SwiftUtils
//
//  Created by Jonathan Pacheco on 1/19/16.
//  Copyright © 2016 Grability. All rights reserved.
//

import Foundation

extension NSObject {
    
    /// The identifier is some
    static var identifier: String {
        get { return identifierFromClass(self) }
    }
    
}

internal func identifierFromClass(objectClass: AnyClass) -> String {
    let name = NSStringFromClass(objectClass)
    let components = name.componentsSeparatedByString(".")
    if components.count > 1 {
        return components[1]
    } else {
        return name
    }
}