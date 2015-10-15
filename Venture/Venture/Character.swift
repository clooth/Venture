//
//  Character.swift
//  Venture
//
//  Created by Nico Hämäläinen on 14/04/15.
//  Copyright (c) 2015 sizeof.io. All rights reserved.
//
import Foundation

/// Possible Genders for Characters
public enum Gender: Int, CustomStringConvertible {
  case Male
  case Female
  
  public var description: String {
    switch self {
    case .Male:   return "male"
    case .Female: return "female"
    }
  }
}

/// Represents a single Character
public class Character: NSObject {
  /// Real name of the `Character`
  public let name: String
  
  /// The gender of the `Character`
  public let gender: Gender
  
  /// The skills that this character possesses
  public var skills: [Skill] = []
  
  // MARK: Work
  
  /// The `Project` this Character is currently working on
  public var activeProject: Project?
  
  /// The `Contract` this Character is currently working on
  public var activeContract: Contract?
  
  // MARK: Initializers
  
  /// Create a new Character
  ///
  /// - parameter name: Real name of the character
  ///
  /// - returns: The Newly created instance
  public init(name: String, gender: Gender) {
    self.name = name
    self.gender = gender
  }
  
  // MARK: Skills
  
  /// Find a Character's skill by its name
  ///
  /// - parameter name: The name of the Skill
  ///
  /// - returns: The found Skill, or nil
  public func skillByName(name: String) -> Skill? {
    return skills.filter({$0.name == name}).last
  }
}
