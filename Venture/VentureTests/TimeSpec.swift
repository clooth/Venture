//
//  TimeSpec.swift
//  Venture
//
//  Created by Nico Hämäläinen on 15/10/15.
//  Copyright © 2015 sizeof.io. All rights reserved.
//
import Quick
import Nimble
import Venture

class Listener: TimeTickerListener {
  var days: Int = 0
  var weeks: Int = 0
  var months: Int = 0
  var years: Int = 0
  
  func timeTickerTick(timeTicker: TimeTicker, unit: TimeTickerUnit) {
    switch unit {
    case .Day: days++
    case .Week: weeks++
    case .Month: months++
    case .Year: years++
    }
  }
}

class TimeSpec: QuickSpec {
  override func spec() {
    
    describe("TimeTicker") {
      pending("should tick every second") {
        let listener = Listener()
        
        let timeTicker = TimeTicker()
        timeTicker.addListener(listener)
        timeTicker.start()
      }
    }
    
  }
}
