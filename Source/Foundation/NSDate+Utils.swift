//
//  NSDate+Utils.swift
//  SwiftUtils
//
//  Created by Jonathan Pacheco on 1/20/16.
//  Copyright © 2016 Grability. All rights reserved.
//

import Foundation

/**
 Adds one day at a specific date
 
 - parameter date: Date to add day
 - parameter days: Number of days
 
 - returns: New date
 */
public func +(date: Date, days: Int) -> Date {
    if days == 0 { return date }
    let gregorian = Calendar(calendarIdentifier: Calendar.Identifier.gregorian)
    // now build a NSDate object for the next day
    var offsetComponents = DateComponents()
    offsetComponents.day = days
    guard let newDate = gregorian?.date(byAdding: offsetComponents,
        to: date,
        options:Calendar.Options(rawValue: 0))
        else { return date }
    return newDate
}

/**
 Subtracts one day at a specific date
 
 - parameter date: Date to subtract day
 - parameter days: Number of days
 
 - returns: New date
 */
public func -(date: Date, days: Int) -> Date? {
    return date + (days * -1)
}

/**
 Checks if a date is within a range of two dates
 
 ```
 if date <=> (lhs, rhs) {
    // The date is within the range
 }
 ```
 
 - parameter date:  Date to check
 - parameter tuple: Tuple with initial and final date
 
 - returns: If date is within range
 */
public func <=>(date: Date, tuple:(start: Date, end: Date)) -> Bool {
    return date >= tuple.start && date <= tuple.end
}

/**
 Checks if date of left is greater than or equals that date of right
 
 - parameter lhs: Left date
 - parameter rhs: Right date
 
 - returns: If date of left is greater than or equals
 */
public func >=(lhs: Date, rhs: Date) -> Bool {
    return evaluateComponent(lhs.timeIntervalSince1970, rhs.timeIntervalSince1970, useOperator: >= )
}

/**
  Checks if date of left is less than or equals that date of right
 
 - parameter lhs: Left date
 - parameter rhs: Right date
 
 - returns: If date of left is greater than or equals
 */
public func <=(lhs: Date, rhs: Date) -> Bool {
    return evaluateComponent(lhs.timeIntervalSince1970, rhs.timeIntervalSince1970, useOperator: <= )
}

/**
 Evaluates two components of date type, for generate a result
 
 - parameter lhs: Left date
 - parameter rhs: Right date
 - parameter callback: Callback for apply operation
 
 - returns: Result of evaluation
 */
private func evaluateComponent(_ lhs: TimeInterval, _ rhs: TimeInterval,
    useOperator callback: (TimeInterval, TimeInterval) -> Bool) -> Bool {
        return callback(lhs, rhs)
}
