//
//  LadderGameTests.swift
//  LadderGameTests
//
//  Created by Daheen Lee on 16/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class LadderGameTests: XCTestCase {
    var ladderGame: LadderGame!
    var height: Int!
    var playerNames: [String]!
    
    override func setUp() {
        
        super.setUp()
        height = 5
        playerNames = ["Diana", "Kate", "Chloe", "Jessy"]
        ladderGame = LadderGame(height: height, playerNames: playerNames)
    }

    override func tearDown() {
        
        ladderGame = nil
        height = nil
        playerNames = nil
        super.setUp()
    }
    
    func testValidStepType() {
        let randomStep = ladderGame.getRandomStep()
        XCTAssertTrue(randomStep == true || randomStep == false, "getRandomStep이 Bool type을 return하지 않습니다.")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
