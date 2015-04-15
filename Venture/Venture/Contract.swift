//
//  Contract.swift
//  Venture
//
//  Created by Nico Hämäläinen on 14/04/15.
//  Copyright (c) 2015 sizeof.io. All rights reserved.
//
import Foundation

/// Represents a single Contract Project developed by a Company
public class Contract: Project {
    /// The requirements for this Project
    var requirements: [Requirement] = []
    
    ///  Create a new Contract
    ///
    ///  :param: name         Name of the Contract
    ///  :param: requirements Requirements of the Contract
    ///
    ///  :returns: The newly created instance
    init(name: String, requirements: [Requirement]) {
        super.init(name: name)
        self.requirements = requirements
    }
}
