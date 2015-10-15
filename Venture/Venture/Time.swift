//
//  Time.swift
//  Venture
//
//  Created by Nico Hämäläinen on 15/04/15.
//  Copyright (c) 2015 sizeof.io. All rights reserved.
//
import Foundation

/// Represents the units of possible Ticks
///
/// - Day:   A Day
/// - Week:  A Week
/// - Month: A Month
/// - Year:  A Year
public enum TimeTickerUnit: Int, CustomStringConvertible {
  case Day = 0
  case Week
  case Month
  case Year
  
  public var description: String {
    switch self {
    case .Day:   return "day"
    case .Week:  return "week"
    case .Month: return "month"
    case .Year:  return "year"
    }
  }
}

/// The `TimeTickerListener` protocol describes the methods that `TimeTicker` objects call on their listeners
/// to handle time-critical events.
public protocol TimeTickerListener: class {
  func timeTickerTick(timeTicker: TimeTicker, unit: TimeTickerUnit)
}

/// The `TimeTickerDurationOverListener` protocl describes the methods that `TimeTickerDuration` objects call
/// on their listeners to handle duration-based events.
public protocol TimeTickerDurationOverListener: class {
  func timeTickerDurationEnded(timeTickerDuration: TimeTickerDuration)
}

/// The `TimeTickerDuration` class represents a duration of time in a number of `TimeTickerUnit` values.
public class TimeTickerDuration: NSObject, TimeTickerListener {
  /// A Set of `TimeTickerUnit` values that make up this `TimeTickerDuration` instance
  private var values: [TimeTickerUnit: Int] = [.Day: 0, .Week: 0, .Month: 0, .Year: 0]
  
  /// A Set of `TimeTickerUnit` values that have passed since initiating this `TimeTickerDuration` instance
  private var passedTicks: [TimeTickerUnit: Int] = [.Day: 0, .Week: 0, .Month: 0, .Year: 0]
  
  /// Checks whether or not the Duration is over by comparing unit values
  public var finished: Bool {
    for (unit, value) in passedTicks {
      if values[unit] != value {
        return false
      }
    }
    
    return true
  }
  
  /// The `TimeTickerDurationOverListener` objects listening to when this `TimeTickerDuration` instance
  /// reaches its final destination.
  private var listeners: [TimeTickerDurationOverListener] = []
  
  // MARK: Initialization
  
  /// Create a new `TimeTickerDuration` instance
  ///
  /// - parameter days:   The number of Day ticks
  /// - parameter weeks:  The number of Week ticks
  /// - parameter months: The number of Month ticks
  /// - parameter years:  The number of Year ticks
  ///
  /// - returns: The initiated `TimeTickerDuration`
  public init(days: Int, weeks: Int, months: Int, years: Int) {
    self.values.updateValue(days,   forKey: .Day)
    self.values.updateValue(weeks,  forKey: .Week)
    self.values.updateValue(months, forKey: .Month)
    self.values.updateValue(years,  forKey: .Year)
    
    super.init()
  }
  
  /// Create a new `TimeTickerDuration` instance
  ///
  /// - parameter values: A Hash of `TimeTickerUnit`s and `Int`s
  ///
  /// - returns: The initiated `TimeTickerDuration`
  public init(values: [TimeTickerUnit: Int]) {
    for (unit, value) in values {
      self.values.updateValue(value, forKey: unit)
    }
    
    super.init()
  }
  
  // MARK: Listeners
  
  /// Add a new `TimeTickerDurationOverListener` to the listeners
  ///
  /// - parameter listener: The listener to add
  public func addListener(listener: TimeTickerDurationOverListener) {
    guard listeners.filter({$0 === listener}).last == nil else { return }
    
    listeners.append(listener)
  }
  
  /// Remove a `TimeTickerDurationOverListener` from the listeners
  ///
  /// - parameter listener: The listener to remove
  public func removeListener(listener: TimeTickerDurationOverListener) {
    listeners = listeners.filter { $0 !== listener }
  }
  
  private func checkAndNotifyListeners() {
    // Check if our duration is over
    if !self.finished { return }
    
    listeners.forEach { $0.timeTickerDurationEnded(self) }
    cancelDuration()
  }
  
  // MARK: Tracking Time
  
  public func startDuration() {
    //TimeTicker.instance.addListener(self)
  }
  
  public func cancelDuration() {
    //TimeTicker.instance.removeListener(self)
  }
  
  // MARK: TimeTickerListener
  
  /// Called whenever a timer ticks a given unit
  /// - parameter timeTicker: The TimeTicker instance ticking
  /// - parameter unit: The time unit it ticked
  public func timeTickerTick(timeTicker: TimeTicker, unit: TimeTickerUnit) {
    let currentValue = passedTicks[unit]!
    passedTicks.updateValue(currentValue + 1, forKey: unit)
  }
}


/// The `TimeTicker` class provides an API for tracking time via Ticks. This API provides a set of delegate
/// methods for supporting the handling of time-critical events.
public class TimeTicker: NSObject {
  /// Singleton instance accessor
  public static let instance = TimeTicker()
  
  /// The number of seconds it takes for a single day to pass in the `TimeTicker`
  public var secondsPerDay: Double = 1
  
  /// The `TimeTickerListener` objects listening to every tick this `TimeTicker` ticks.
  private var listeners: [TimeTickerListener] = []
  
  /// Current time ticker unit values
  private var values: [TimeTickerUnit: Int] = [.Day: 0, .Week: 0, .Month: 0, .Year: 0]
  
  /// Total number of days ticked
  private var totalValues: [TimeTickerUnit: Int] = [.Day: 0, .Week: 0, .Month: 0, .Year: 0]
  
  /// Whether or not the ticker should keep running
  private var running: Bool = false
  
  // MARK: Initializers
  
  public override init() {
    super.init()
  }
  
  // MARK: Listeners
  
  /// Add a `TimeTickerListener` to the listeners
  ///
  /// - parameter listener: The listener to add
  public func addListener(listener: TimeTickerListener) {
    guard listeners.filter({$0 === listener}).last == nil else { return }

    listeners.append(listener)
  }
  
  /// Remove a `TimeTickerListener` from the listeners
  ///
  /// - parameter listener: The listener to remove
  public func removeListener(listener: TimeTickerListener) {
    listeners = listeners.filter({ $0 !== listener })
  }
  
  // MARK: Ticking
  
  public func start() {
    running = true
    executeTick()
  }
  
  public func stop() {
    running = false
  }
  
  public func reset() {
    values = [.Day: 0, .Week: 0, .Month: 0, .Year: 0]
    totalValues = [.Day: 0, .Week: 0, .Month: 0, .Year: 0]
    listeners = []
  }
  
  /// Execute all the required ticks
  private func executeTick() {
    if !running { return }
    
    // Increase values and notify listeners
    values[.Day]!++; totalValues[.Day]!++
    tick(.Day)
        
    // Reset days if we're done with this one
    if values[.Day] == 4 {
      values[.Day] = 0
      values[.Week]!++
      tick(.Week)
    }
    
    // Reset weeks if we're done with this month
    if values[.Week] == 4 {
      values[.Week] = 0
      values[.Month]!++
      tick(.Month)
    }
    
    // Reset months if we're done with this year
    if values[.Month] == 12 {
      values[.Month] = 0
      values[.Year]!++
      tick(.Year)
    }
    
    // Execute next tick
    delay(secondsPerDay) {
      self.executeTick()
    }
  }
  
  /// Execute a single `TimeTickerUnit` tick
  ///
  /// - parameter timeUnit: The `TimeTickerUnit` to send the events with
  private func tick(timeUnit: TimeTickerUnit) {
    listeners.forEach { $0.timeTickerTick(self, unit: timeUnit) }
  }
}

extension TimeTicker {
  override public var description: String {
    return "Y\(values[.Year]!) M\(values[.Month]!) W\(values[.Week]!) D\(values[.Day]!)"
  }
}