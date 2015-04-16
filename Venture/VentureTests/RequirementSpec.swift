//
//  RequirementSpec.swift
//  Venture
//
//  Created by Nico Hämäläinen on 15/04/15.
//  Copyright (c) 2015 sizeof.io. All rights reserved.
//
import Quick
import Nimble
import Venture

class RequirementSpec: QuickSpec {
    override func spec() {

        describe("The `Requirement` class") {
            var requirement: Requirement!
            
            beforeEach {
                requirement = Requirement(name: "Design", requiredPoints: 20)
            }
            
            it("should allow adding points") {
                requirement.addPoints(5)
                expect(requirement.gatheredPoints).to(equal(5))
            }
        }
        
    }
}
