//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by jack on 2017. 12. 8..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import XCTest
@testable import LadderGame

class UnitTestLadderGame: XCTestCase {
    var ladderGameUnderTest : LadderGame!
    
    func testLadderGame() {
        func testUserinputCanBeInserted() {
            let names = ["kwon","jack","code"]
            let height = 5
            ladderGameUnderTest = LadderGame.init(namesVal: names, heightVal: height)
            XCTAssertNotNil(ladderGameUnderTest.names)
            XCTAssertEqual(ladderGameUnderTest.names.count, 3)
            XCTAssertNotNil(ladderGameUnderTest.height)
            XCTAssertEqual(ladderGameUnderTest.height, 5)
        }
        
        func testGeneratingArrayOfBoolForFrameOfLadder() {
            let names = ["jack","koo","will","jake"]
            let numOfHeight = 4
            let numOfPlayerNames = names.count
            let FrameOfLadder = ladderGameUnderTest.generateFrameOfLadder(entryVal: numOfPlayerNames, heightVal: numOfHeight)
            XCTAssertNotNil(FrameOfLadder)
            XCTAssertEqual(FrameOfLadder[0].count, 3)
            XCTAssertEqual(FrameOfLadder.count, 4)
        }

        func testReturningBool() {
            let isRandom = ladderGameUnderTest.makeRandomHorizontalLine(true)
            let isFalse = ladderGameUnderTest.makeRandomHorizontalLine(false)
            XCTAssertEqual(isRandom, true || false)
            XCTAssertEqual(isFalse, false)
        }
        
        
        func testGeneratingRandomLadder() {
            let frameOfOneFloorLadder = [false,false]
            XCTAssertNotNil(ladderGameUnderTest.generateOneFloorOfLadder(oneFloorOfLadder: frameOfOneFloorLadder))
            
            let ladder = [[false,false], [false,false]]
            XCTAssertNotNil(ladderGameUnderTest.generateRandomLadder(frameOfLadder: ladder ))
        }

    }
}
