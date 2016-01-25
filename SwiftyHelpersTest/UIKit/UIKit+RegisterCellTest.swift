//
//  UIKit+RegisterCellTest.swift
//  SwiftUtils
//
//  Created by Jonathan Pacheco on 1/19/16.
//  Copyright © 2016 Grability. All rights reserved.
//

import XCTest
@testable import SwiftyHelpers

class UIKit_RegisterCellTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRegisterTableViewCell() {
        
        let tableView = UITableView()
        tableView <= TestTableViewCell.self
        
        let cell: TestTableViewCell = tableView.cellForClass()
        XCTAssertNotNil(cell, "Cell register cannot be nil")
    }

}
