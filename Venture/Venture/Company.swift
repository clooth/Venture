//
//  Company.swift
//  Venture
//
//  Created by Nico Hämäläinen on 14/04/15.
//  Copyright (c) 2015 sizeof.io. All rights reserved.
//

import Foundation

/// Represents a single Company where people work on Projects and Contracts
public class Company: NSObject {
    /// The name of the Company
    public var name: String
    
    /// The Staff working at the Company
    var staff: [Character] = []
    
    /// A log of all the Projects this Company has worked on
    var projects: [Project] = []
    
    /// The current Project the Company is working on
    var currentProject: Project?
    
    /// A log of all the Contracts this Company has worked on
    var contracts: [Contract] = []
    
    /// The current Contract the Company is working on
    var currentContract: Contract?
    
    // MARK: Initializers
    
    ///  Create a new Company
    ///
    ///  :param: name Name of the Company
    ///
    ///  :returns: The newly created instance
    public init(name: String) {
        self.name = name
    }
    
    // MARK: Hiring
    
    ///  Hire a new Employee
    ///
    ///  :param: character The Character to hire
    public func hire(character: Character) {
        if let found = staff.filter({$0.name == character.name}).last {
            return
        }
        
        self.staff.append(character)
    }
    
    ///  Fire an Employee
    ///
    ///  :param: character The Character to fire
    public func fire(character: Character) {
        for (index, value) in enumerate(staff) {
            if value === character {
                staff.removeAtIndex(index)
                break
            }
        }
    }
    
    // MARK: Projects
    
    ///  Start a new Project
    ///
    ///  :param: projectName The name of the Project
    ///
    ///  :returns: The new Project instance
    public func startProject(projectName: String) -> Project {
        var project = Project(name: projectName)
        return project
    }
}