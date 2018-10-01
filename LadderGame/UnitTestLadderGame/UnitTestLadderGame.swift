//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by 조재흥 on 2018. 9. 29..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import XCTest
@testable import LadderGame

class UnitTestLadderGame: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIsValidNamesFromOneToFive() {
        let oneToFive = "a,bb,ccc,dddd,eeeee"
        XCTAssertTrue(ValidityCheck().isValid(names: oneToFive))
    }
    
    func testIsValidNamesFromSixToSeven() {
        let sixToSeven = "ffffff,ggggggg"
        XCTAssertFalse(ValidityCheck().isValid(names: sixToSeven))
    }
    
    func testIsValidHeightOfTwo() {
        let two = 2
        XCTAssertTrue(ValidityCheck().isValid(height: two))
    }
    
    func testIsValidHeightOfOne() {
        let one = 1
        XCTAssertFalse(ValidityCheck().isValid(height: one))
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
