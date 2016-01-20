//
//  FrameHelpersTest.swift
//  SwiftUtils
//
//  Created by Jonathan Pacheco on 1/19/16.
//  Copyright © 2016 Grability. All rights reserved.
//

import XCTest
@testable import SwiftUtils

class FrameHelpersTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testPutFrame() {
        var frame = CGRectZero
        frame.width = 80
        frame.height = 100
        frame.x = 50
        frame.y = 25
        
        XCTAssertEqual(CGRectGetWidth(frame), 80.0)
        XCTAssertEqual(CGRectGetHeight(frame), 100.0)
        XCTAssertEqual(CGRectGetMinX(frame), 50.0)
        XCTAssertEqual(CGRectGetMidX(frame), 90.0)
        XCTAssertEqual(CGRectGetMaxX(frame), 130.0)
        XCTAssertEqual(CGRectGetMinY(frame), 25.0)
        XCTAssertEqual(CGRectGetMidY(frame), 75.0)
        XCTAssertEqual(CGRectGetMaxY(frame), 125.0)
    }
    
    func testFrameInView() {
        let view = UIView()
        view.width = 80
        view.height = 100
        view.x = 50
        view.y = 25
        
        XCTAssertEqual(CGRectGetWidth(view.frame), 80.0)
        XCTAssertEqual(CGRectGetHeight(view.frame), 100.0)
        XCTAssertEqual(CGRectGetMinX(view.frame), 50.0)
        XCTAssertEqual(CGRectGetMidX(view.frame), 90.0)
        XCTAssertEqual(CGRectGetMaxX(view.frame), 130.0)
        XCTAssertEqual(CGRectGetMinY(view.frame), 25.0)
        XCTAssertEqual(CGRectGetMidY(view.frame), 75.0)
        XCTAssertEqual(CGRectGetMaxY(view.frame), 125.0)
    }

}
