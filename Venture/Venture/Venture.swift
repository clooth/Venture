//
//  Venture.swift
//  Venture
//
//  Created by Nico Hämäläinen on 15/04/15.
//  Copyright (c) 2015 sizeof.io. All rights reserved.
//

import Foundation

public class Venture: NSObject, Printable {
    public static let BuildVersion: String = "0.0.1"
    
    override public var description: String {
        return "Venture \(Venture.BuildVersion)"
    }
}