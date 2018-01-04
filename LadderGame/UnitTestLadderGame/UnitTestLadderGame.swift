//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by 김수현 on 2018. 1. 3..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import XCTest

class UnitTestLaddergame: XCTestCase {
    
    var laddergameTest: LadderGame!
    
    override func setUp() {
        super.setUp()
        let height = 5
        let players = ["honux","jk","crong","pobi"]
        laddergameTest = LadderGame.init(height, players)
    }
    
    override func tearDown() {
        super.tearDown()
        laddergameTest = nil
    }
    
    func testLaddergame() {
        XCTAssertNotNil(laddergameTest)
    }
    
    func testGenerateLadders() {
        let generateLadder = laddergameTest.generateLadders()
        XCTAssertNotNil(generateLadder)
    }
    
    func testHasLadders() {
        let ladder = laddergameTest.getNumberOfLadder(true)
        XCTAssertEqual(ladder, "-----")
    }
    
    func testNotLadders() {
        let ladder = laddergameTest.getNumberOfLadder(false)
        XCTAssertEqual(ladder, "     ")
    }
    
    func testInputPlayer() {
        XCTAssertNotNil(laddergameTest.name)
        XCTAssertEqual(laddergameTest.name.count, 4)
    }
    
    func testInputHeight() {
        XCTAssertNotNil(laddergameTest.height)
        XCTAssertEqual(laddergameTest.height, 5)
    }
    
    func testNotNilPlayer() {
        let height = 10
        let players: [String] = []
        XCTAssertNotNil(LadderGame(height, players))
    }
    
    func testNotNilLadders() {
        let height = 0
        let players: [String] = ["pobi", "JK"]
        XCTAssertNotNil(LadderGame(height, players))
    }
    
    func testNilPlayer() {
        let height = 10
        let players: [String] = []
        XCTAssertNil(LadderGame(height, players))
    }
    
    func testNilLadders() {
        let height = 0
        let players: [String] = ["pobi", "JK"]
        XCTAssertNil(LadderGame(height, players))
    }
    
    func testNumerousPlayer() {
        let height = 0
        let players = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
        XCTAssertNotNil(LadderGame(height, players))
    }
    
    func testNumerousLadders() {
        let height = 100
        let players: [String] = []
        XCTAssertNotNil(LadderGame(height, players))
    }
}
