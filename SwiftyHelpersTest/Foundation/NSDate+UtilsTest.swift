//
//  NSDate+UtilsTest.swift
//  SwiftyHelpers
//
//  Created by Jonathan Pacheco on 1/24/16.
//  Copyright © 2016 Grability. All rights reserved.
//

import XCTest
@testable import SwiftyHelpers

/// Date: 1/1/2016 00:00:00
private let testDate_1_1_2016 =     NSDate(timeIntervalSince1970: 1451606400)
/// Date: 31/12/2015 00:00:00
private let testDate_31_12_2015 =   NSDate(timeIntervalSince1970: 1451520000)
/// Date: 2/1/2016 00:00:00
private let testDate_2_1_2016 =     NSDate(timeIntervalSince1970: 1451692800)
/// Date: 3/1/2016 00:00:00
private let testDate_3_1_2016 =     NSDate(timeIntervalSince1970: 1451779200)

class NSDate_UtilsTest: XCTestCase {
        
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testAddDayToDate() {
        let dateTest = testDate_1_1_2016 + 1
        
        XCTAssertEqual(dateTest, testDate_2_1_2016, "Adds day to date failed")
        
        let dateFailTest = testDate_1_1_2016 + 1
        XCTAssertNotEqual(dateFailTest, testDate_31_12_2015, "Adds day to date failed")
    }
    
    func testSubtractDayToDate() {
        let dateTest = testDate_1_1_2016 - 1
        XCTAssertEqual(dateTest, testDate_31_12_2015, "Adds day to date failed")
        
        let dateFailTest = testDate_1_1_2016 - 1
        XCTAssertNotEqual(dateFailTest, testDate_2_1_2016, "Adds day to date failed")
    }
    
    func testEqualsDate() {
        XCTAssertTrue(testDate_1_1_2016 == testDate_1_1_2016)
        XCTAssertFalse(testDate_2_1_2016 == testDate_3_1_2016)
    }
    
    func testLessThanOrEquals() {
        XCTAssertTrue(testDate_1_1_2016 >= testDate_31_12_2015)
        XCTAssertTrue(testDate_1_1_2016 >= testDate_1_1_2016)
        XCTAssertFalse(testDate_2_1_2016 >= testDate_3_1_2016)
    }
    
    func testGreaterThanOrEquals() {
        XCTAssertTrue(testDate_31_12_2015 <= testDate_1_1_2016)
        XCTAssertTrue(testDate_1_1_2016 <= testDate_1_1_2016)
        XCTAssertFalse(testDate_3_1_2016 <= testDate_2_1_2016)
    }
    
    func testGreaterThan() {
        XCTAssertTrue(testDate_1_1_2016 > testDate_31_12_2015)
        XCTAssertFalse(testDate_1_1_2016 > testDate_1_1_2016)
        XCTAssertFalse(testDate_2_1_2016 > testDate_3_1_2016)
    }
    
    func testLessThan() {
        XCTAssertTrue(testDate_1_1_2016 < testDate_2_1_2016)
        XCTAssertFalse(testDate_1_1_2016 < testDate_1_1_2016)
        XCTAssertFalse(testDate_2_1_2016 < testDate_1_1_2016)
    }
    
    func testBetweenDates() {
        XCTAssertTrue(testDate_1_1_2016 <=> (testDate_31_12_2015, testDate_2_1_2016))
        XCTAssertFalse(testDate_1_1_2016 <=> (testDate_2_1_2016, testDate_3_1_2016))
    }
    
}
