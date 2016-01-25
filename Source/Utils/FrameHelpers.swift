//
//  FrameHelpers.swift
//  SwiftUtils
//
//  Created by Jonathan Pacheco on 1/19/16.
//  Copyright © 2016 Grability. All rights reserved.
//

import UIKit

extension CGRect {
    
    var width: CGFloat {
        get { return CGRectGetWidth(self) }
        set { self.size.width = newValue }
    }
    
    var height: CGFloat {
        get { return CGRectGetHeight(self) }
        set { self.size.height = newValue }
    }
    
    var x: CGFloat {
        get { return CGRectGetMinX(self) }
        set { self.origin.x = newValue }
    }
    
    var y: CGFloat {
        get { return CGRectGetMinY(self) }
        set { self.origin.y = newValue }
    }
    
}

extension UIView {
    
    var width: CGFloat {
        get { return self.bounds.width }
        set { self.frame.width = newValue }
    }
    
    var height: CGFloat {
        get { return self.bounds.height }
        set { self.frame.height = newValue }
    }
    
    var x: CGFloat {
        get { return self.frame.x }
        set { self.frame.x = newValue }
    }
    
    var y: CGFloat {
        get { return self.frame.y }
        set { self.frame.y = newValue }
    }
    
    var minX: CGFloat {
        get { return self.frame.midX }
    }
    
    var midY: CGFloat {
        get { return self.frame.midY }
    }
    
    
    var maxX: CGFloat {
        get { return self.frame.maxX }
    }
    
    var maxY: CGFloat {
        get { return self.frame.maxY }
    }
    
}