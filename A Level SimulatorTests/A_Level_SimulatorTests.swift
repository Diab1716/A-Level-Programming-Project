//
//  A_Level_SimulatorTests.swift
//  A Level SimulatorTests
//
//  Created by Diab, Ahmed (HWTA) on 14/09/2022.
//

import XCTest
@testable import A_Level_Simulator

class A_Level_SimulatorTests: XCTestCase {
    let field = GravitationalField()
    
    func testCalculateBallVelocityFunctionReturnsExpectedValue(){
        //arrange
        
        
        let startPosition:CGPoint = CGPoint(x: 50, y: 50)
        let endPosition:CGPoint = CGPoint(x: 75, y: 25)
        let expectedValue = CGVector(dx: -25, dy: 25)
        let calculatedValue = field.calculateBallVelocity(startPosition: startPosition,endPosition: endPosition)
        
        XCTAssert(expectedValue == calculatedValue)
    }
    
    

}
