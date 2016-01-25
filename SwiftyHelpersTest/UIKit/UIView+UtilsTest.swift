//
//  UIView+UtilsTest.swift
//  SwiftyHelpers
//
//  Created by Jonathan Pacheco on 1/24/16.
//  Copyright © 2016 Grability. All rights reserved.
//

import XCTest
@testable import SwiftyHelpers

class UIView_UtilsTest: XCTestCase {
        
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
    }
    
    func testRemoveAllSubviews() {
        
        let viewTest = UIView()
        let view = UIView()
        let view2 = UIView()
        
        view.addSubview(view2)
        view2.addSubview(UIView())
        
        view.addSubview(UIView())
        
        viewTest.addSubview(UIView())
        viewTest.addSubview(UIView())
        viewTest.addSubview(view)
        
        viewTest.removeAllSubViews()
        
        XCTAssertEqual(viewTest.subviews.count, 0, "viewTest cannot have subviews")
        XCTAssertEqual(view2.subviews.count, 0, "view2 cannot have subviews")
        XCTAssertEqual(view.subviews.count, 0, "view cannot have subviews")
    }
    
    func testFindViewForClass() {
        class FooView: UIView {}
        
        let view = UIView()
        let view2 = UIView()
        let view3 = UIView()
        let fooView = FooView()
        
        view.addSubview(UIView())
        view.addSubview(view2)
        view2.addSubview(view3)
        view2.addSubview(fooView)
        view2.addSubview(UIView())
        view3.addSubview(UIView())
        
        let findView: FooView? = getSubviewIntoView(view)
        XCTAssertNotNil(findView, "fooView no found")
    }
    
    func testLoadCustomView() {
        guard let testView: TestView = loadCustomView() else {
            XCTAssert(false)
            return
        }
        XCTAssertTrue(testView.classForCoder is TestView.Type, "testView need TestView Type")
        XCTAssertNotNil(testView, "testView cannot be nil")
    }
    
}
