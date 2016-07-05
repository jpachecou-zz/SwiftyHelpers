//
//  NSObject+Utils.swift
//  SwiftUtils
//
//  Created by Jonathan Pacheco on 1/19/16.
//  Copyright © 2016 Grability. All rights reserved.
//

import Foundation

public protocol Identificable: AnyObject {}

extension Identificable {
    /// The identifier is some
    public static var identifier: String {
        get { return _id(Self.self) }
    }
}

extension NSObject: Identificable {}

internal func _id<T: AnyObject>(_ objectClass: T.Type) -> String {
    let name = NSStringFromClass(objectClass)
    let components = name.components(separatedBy: ".")
    if components.count > 1 {
        return components[1]
    } else {
        return name
    }
}
