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
    var name: String
    
    /// The matching `Skill` object
    var matchingSkill: Skill?
    
    // MARK: Points
    
    /// The current amount of points gathered
    var gatheredPoints: Int = 0
    
    /// The amount of points required for this `Requirement` to be considered satisfied
    var requiredPoints: Int = 0
    
    /// Checks whether or not our requirement has been satisfied
    var satisfied: Bool {
        return gatheredPoints >= requiredPoints
    }
    
    // MARK: Initializers
    
    /// Create a new Requirement
    ///
    /// :param: name           The displayed name
    /// :param: requiredPoints The amount of points required
    ///
    /// :returns: The newly created instance
    init(name: String, requiredPoints: Int) {
        self.name = name
        self.requiredPoints = requiredPoints
    }
    
    // MARK: Points
    
    ///  Add a number of points to the Requirement
    ///
    ///  :param: amount Number of points to add
    ///
    ///  :returns: The number of points added
    public func addPoints(amount: Int) -> Int {
        gatheredPoints = min(amount + gatheredPoints, requiredPoints)
        return requiredPoints - gatheredPoints
    }
}
