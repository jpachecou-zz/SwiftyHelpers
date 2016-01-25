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
func +(date: NSDate, days: Int) -> NSDate {
    if days == 0 { return date }
    let gregorian = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
    // now build a NSDate object for the next day
    let offsetComponents = NSDateComponents()
    offsetComponents.day = days
    guard let newDate = gregorian?.dateByAddingComponents(offsetComponents,
        toDate: date,
        options:NSCalendarOptions(rawValue: 0))
        else { return date }
    return newDate
}

/**
 Subtracts one day at a specific date
 
 - parameter date: Date to subtract day
 - parameter days: Number of days
 
 - returns: New date
 */
func -(date: NSDate, days: Int) -> NSDate? {
    return date + (days * -1)
}

/**
 Checks if a date is within a range of two dates
 
 ```
 if date <=> (start: date1, end: date2) {
    // The date is within the range
 }
 ```
 
 - parameter date:  Date to check
 - parameter tuple: Tuple with initial and final date
 
 - returns: If date is within range
 */
func <=>(date: NSDate, tuple:(start: NSDate, end: NSDate)) -> Bool {
    return date >= tuple.start && date <= tuple.end
}

/**
 Checks if date of left is greater than or equals that date of right
 
 - parameter dateF: Left date
 - parameter dateS: Right date
 
 - returns: If date of left is greater than or equals
 */
func >=(dateF: NSDate, dateS: NSDate) -> Bool {
    return evaluateComponent(dateF, dateS, useOperator: >= )
}

/**
  Checks if date of left is less than or equals that date of right
 
 - parameter dateF: Left date
 - parameter dateS: Right date
 
 - returns: If date of left is greater than or equals
 */
func <=(dateF: NSDate, dateS: NSDate) -> Bool {
    return evaluateComponent(dateF, dateS, useOperator: <= )
}

/**
 Checks if date of left is greater than that date of right
 
 - parameter dateF: Left date
 - parameter dateS: Right date
 
 - returns: If date of left is greater than
 */
func >(dateF: NSDate, dateS: NSDate) -> Bool {
    return evaluateComponent(dateF, dateS, useOperator: > )
}

/**
 Checks if date of left is less than that date of right
 
 - parameter dateF: Left date
 - parameter dateS: Right date
 
 - returns: If date of left is less than
 */
func <(dateF: NSDate, dateS: NSDate) -> Bool {
    return evaluateComponent(dateF, dateS, useOperator: < )
}

/**
 Evaluates two components of date type, for generate a result
 
 - parameter dateF:    Left date
 - parameter dateS:    Right date
 - parameter callback: Callback for apply operation
 
 - returns: Result of evaluation
 */
private func evaluateComponent(dateF: NSDate, _ dateS: NSDate, useOperator callback: (Int, Int) -> Bool) -> Bool {
    let calendar = NSCalendar.currentCalendar()
    let componentsF = calendar.components([.Month, .Day, .Year], fromDate: dateF)
    let componentsS = calendar.components([.Month, .Day, .Year], fromDate: dateS)
    
    var result = false
    result =  callback(componentsF.year, componentsS.year)
    result = result && callback(componentsF.month, componentsS.month)
    result = result && callback(componentsF.day, componentsS.day)
    
    return result
}