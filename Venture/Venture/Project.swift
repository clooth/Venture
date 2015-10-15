//
//  Project.swift
//  Venture
//
//  Created by Nico Hämäläinen on 14/04/15.
//  Copyright (c) 2015 sizeof.io. All rights reserved.
//
import Foundation

/// Represents a single Project developed within a Company
public class Project: NSObject {
  /// Displayed name of the Project
  var name: String
  
  /// Create a new Project
  ///
  /// - parameter name: Name of the Project
  ///
  /// - returns: The newly created instance
  init(name: String) {
    self.name = name
  }
}
