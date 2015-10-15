//
//  Requirement.swift
//  Venture
//
//  Created by Nico Hämäläinen on 14/04/15.
//  Copyright (c) 2015 sizeof.io. All rights reserved.
//
import Foundation

/// Represents a single Requirement of a Project
public class Requirement: NSObject {
  /// The name of the Requirement
  /// Think: "Gameplay", "Usability", "Ambient Music"
  private(set) public var name: String
  
  /// The matching `Skill` object
  private(set) public var matchingSkill: Skill?
  
  // MARK: Points
  
  /// The current amount of points gathered
  public var gatheredPoints: Int = 0
  
  /// The amount of points required for this `Requirement` to be considered satisfied
  private(set) public var requiredPoints: Int = 0
  
  /// Checks whether or not our requirement has been satisfied
  public var satisfied: Bool {
    return gatheredPoints >= requiredPoints
  }
  
  // MARK: Initializers
  
  /// Create a new Requirement
  ///
  /// - parameter name:           The displayed name
  /// - parameter requiredPoints: The amount of points required
  ///
  /// - returns: The newly created instance
  public init(name: String, requiredPoints: Int) {
    self.name = name
    self.requiredPoints = abs(requiredPoints)
  }
  
  // MARK: Points
  
  /// Add a number of points to the Requirement
  ///
  /// - parameter amount: Number of points to add
  ///
  /// - returns: The number of points added
  public func addPoints(amount: Int) -> Int {
    gatheredPoints = min(abs(amount) + gatheredPoints, requiredPoints)
    return requiredPoints - gatheredPoints
  }
}
