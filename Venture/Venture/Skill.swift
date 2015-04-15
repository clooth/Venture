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
    static let MAXIMUM_LEVEL: Int = 255
    
    /// The name of the Skill
    /// Think: "Programming", "Cooking", "Design"
    var name: String
    
    /// Current Skill level
    var level: Int = 0
    
    /// Create a new Skill
    ///
    /// :param: name The displayed name
    ///
    /// :returns: The newly created instance
    init(name: String) {
        self.name = name
    }
}
