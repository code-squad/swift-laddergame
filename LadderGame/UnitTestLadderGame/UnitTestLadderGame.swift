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
    
    override func setUp() {
        super.setUp()
        let names = ["kwon","jack","code"]
        let height = 5
        ladderGameUnderTest = LadderGame.init(namesVal: names, heightVal: height)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        ladderGameUnderTest = nil
    }
    
    func testLadderGame() {
        //init() 테스트
        XCTAssertNotNil(ladderGameUnderTest.names)
        XCTAssertEqual(ladderGameUnderTest.names.count, 3)
        XCTAssertNotNil(ladderGameUnderTest.height)
        XCTAssertEqual(ladderGameUnderTest.height, 5)
        
        let playersNames = ladderGameUnderTest.names.count
        let heightOfLadder = ladderGameUnderTest.height
        
        //generateFrameOfLadder() 테스트
        XCTAssertNotNil(ladderGameUnderTest.generateFrameOfLadder(entryVal: playersNames, heightVal: heightOfLadder))
        
        // makeRandomHorizontalLine() 테스트
        XCTAssertFalse(ladderGameUnderTest.makeRandomHorizontalLine(false))
        XCTAssertEqual(ladderGameUnderTest.makeRandomHorizontalLine(true), true || false)
        
        // generateString() 테스트
        XCTAssertEqual(ladderGameUnderTest.generateString(playersNames, char: "-"), "----")
        
        // generateOneFloorOfLadder() 테스트
        XCTAssertNotNil(ladderGameUnderTest.generateOneFloorOfLadder(oneFloorOfLadder: [false, false]))
        
        // generateRandomLadder() 테스트
        XCTAssertNotNil(ladderGameUnderTest.generateRandomLadder(frameOfLadder: [[false,false], [false,false]]))
    }
}
