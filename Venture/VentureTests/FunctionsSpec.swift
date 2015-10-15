//
//  FunctionsSpec.swift
//  Venture
//
//  Created by Nico Hämäläinen on 15/04/15.
//  Copyright (c) 2015 sizeof.io. All rights reserved.
//
import Quick
import Nimble
import Venture

class FunctionsSpec: QuickSpec {
  override func spec() {
    
    describe("The `delay` function") {
      it("should delay the execution by a given time") {
        var value = false
        delay(0.5) {
          value = true
        }
        expect(value).toEventually(beTrue())
      }
    }
    
  }
}
