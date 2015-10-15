//
//  Skill.swift
//  Venture
//
//  Created by Nico Hämäläinen on 14/04/15.
//  Copyright (c) 2015 sizeof.io. All rights reserved.
//
import Foundation

/// Represents a single Skill of a Character
public class Skill: NSObject {
  /// Maximum possible level
  public static let MAXIMUM_LEVEL: Int = 255
  
  /// The name of the Skill
  /// Think: "Programming", "Cooking", "Design"
  public var name: String
  
  /// Current Skill level
  public var level: Int
  
  /// Create a new Skill
  ///
  /// - parameter name: The displayed name
  ///
  /// - returns: The newly created instance
  public init(name: String, level: Int = 0) {
    self.name = name
    self.level = level
  }
  
  // MARK: Level ups
  
  /// Increase the level of this skill by a given amount
  /// - parameter steps: The amount of steps to increase by
  /// - returns: The new level
  public func increaseLevel(steps: Int) -> Int {
    let newLevel = min(level + steps, Skill.MAXIMUM_LEVEL)
    let stepsIncreased = newLevel - level
    level = newLevel
    
    return stepsIncreased
  }
  
  /// Increase the level of this skill by a random amount
  /// - parameter maximumIncrease: The maximum amount to increase by
  /// - returns: The new level
  public func increaseLevelRandomly(maximumIncrease: Int) -> Int {
    let draw = Int.random(1...maximumIncrease)
    level = min(level + draw, Skill.MAXIMUM_LEVEL)
    
    return draw
  }
}
