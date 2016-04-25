//
//  FrameHelpers.swift
//  SwiftUtils
//
//  Created by Jonathan Pacheco on 1/19/16.
//  Copyright © 2016 Grability. All rights reserved.
//

import UIKit

public extension CGRect {

    public var x: CGFloat {
        get { return CGRectGetMinX(self) }
        set { self.origin.x = newValue }
    }

    public var y: CGFloat {
        get { return CGRectGetMinY(self) }
        set { self.origin.y = newValue }
    }

}

public extension UIView {

    public var width: CGFloat {
        get { return self.bounds.width }
        set { self.frame.size.width = newValue }
    }

    public var height: CGFloat {
        get { return self.bounds.height }
        set { self.frame.size.height = newValue }
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
