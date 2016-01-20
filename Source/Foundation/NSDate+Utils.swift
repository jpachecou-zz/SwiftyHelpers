//
//  NSDate+Utils.swift
//  SwiftUtils
//
//  Created by Jonathan Pacheco on 1/20/16.
//  Copyright © 2016 Grability. All rights reserved.
//

import Foundation

/**
 <#Description#>
 
 - parameter date: <#date description#>
 - parameter days: <#days description#>
 
 - returns: <#return value description#>
 */
func +(date: NSDate, days: Int) -> NSDate {
    if days == 0 { return date }
    let gregorian = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
    // now build a NSDate object for the next day
    let offsetComponents = NSDateComponents()
    offsetComponents.day = days
    guard let newDate = gregorian?.dateByAddingComponents(offsetComponents, toDate: date, options:NSCalendarOptions(rawValue: 0))
        else { return date }
    return newDate
}

/**
 <#Description#>
 
 - parameter date: <#date description#>
 - parameter days: <#days description#>
 
 - returns: <#return value description#>
 */
func -(date: NSDate, days: Int) -> NSDate? {
    return date + (days * -1)
}

/**
 <#Description#>
 
 - parameter date:  <#date description#>
 - parameter tuple: <#tuple description#>
 
 - returns: <#return value description#>
 */
func <=>(date: NSDate, tuple:(start: NSDate, end: NSDate)) -> Bool {
    return date >= tuple.start && date <= tuple.end
}

/**
 <#Description#>
 
 - parameter dateF: <#dateF description#>
 - parameter dateS: <#dateS description#>
 
 - returns: <#return value description#>
 */
func >=(dateF: NSDate, dateS: NSDate) -> Bool {
    return evaluateComponent(dateF, dateS, useOperator: >= )
}

/**
 <#Description#>
 
 - parameter dateF: <#dateF description#>
 - parameter dateS: <#dateS description#>
 
 - returns: <#return value description#>
 */
func <=(dateF: NSDate, dateS: NSDate) -> Bool {
    return evaluateComponent(dateF, dateS, useOperator: <= )
}

/**
 <#Description#>
 
 - parameter dateF: <#dateF description#>
 - parameter dateS: <#dateS description#>
 
 - returns: <#return value description#>
 */
func >(dateF: NSDate, dateS: NSDate) -> Bool {
    return evaluateComponent(dateF, dateS, useOperator: > )
}

/**
 <#Description#>
 
 - parameter dateF: <#dateF description#>
 - parameter dateS: <#dateS description#>
 
 - returns: <#return value description#>
 */
func <(dateF: NSDate, dateS: NSDate) -> Bool {
    return evaluateComponent(dateF, dateS, useOperator: < )
}

/**
 <#Description#>
 
 - parameter dateF:    <#dateF description#>
 - parameter dateS:    <#dateS description#>
 - parameter callback: <#callback description#>
 
 - returns: <#return value description#>
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