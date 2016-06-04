//
//  UIView+Utils.swift
//  SwiftUtils
//
//  Created by Jonathan Pacheco on 1/19/16.
//  Copyright © 2016 Grability. All rights reserved.
//

import UIKit

public extension UIView {
    
    /**
     Remove all sub view recursively
     */
    func removeAllSubViews() {
        for view in self.subviews {
            view.removeAllSubViews()
            view.removeFromSuperview()
        }
    }
    
}

/**
 Get subview of Class type from superview
 
 example: `let tableView: UITableView? = getSubviewIntoView(superView)`
 
 - parameter intoView: Super view
 
 - returns: First elemend find of the genericType
 */
public func getSubviewIntoView<T: UIView>(intoView: UIView) -> T? {
    for view in intoView.subviews {
        if view.classForCoder is T.Type {
            return view as? T
        }
        if let view: T = getSubviewIntoView(view) {
            return view
        }
    }
    return nil
}

/**
 Load view from nib, only when the view can is equals name of xib
 
 example: `let fooView: FooView? = loadCustomView()`
 
 - returns: Loaded view class
 */
public func loadCustomView<T: UIView>() -> T? {
    let views = NSBundle(forClass: T.self).loadNibNamed(_id(T), owner: nil, options: nil)
    if views.count > 0 {
        return views.first as? T
    }
    return nil
}