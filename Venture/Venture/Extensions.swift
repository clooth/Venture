//
//  Extensions.swift
//  Venture
//
//  Created by Nico Hämäläinen on 16/04/15.
//  Copyright (c) 2015 sizeof.io. All rights reserved.
//

import Foundation


public extension Int {
  ///  Get a random `Int` within a given range
  ///
  ///  - parameter range: The Range to get the int from
  ///
  ///  - returns: A Random Integer
  static func random(range: Range<Int> ) -> Int {
    var offset = 0
    
    if range.startIndex < 0 {
      offset = abs(range.startIndex)
    }
    
    let mini = UInt32(range.startIndex + offset)
    let maxi = UInt32(range.endIndex   + offset)
    
    return Int(mini + arc4random_uniform(maxi - mini)) - offset
  }
}