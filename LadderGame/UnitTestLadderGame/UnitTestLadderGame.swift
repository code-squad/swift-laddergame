//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by moon on 2018. 3. 27..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import XCTest
@testable import LadderGame

class UnitTestLadderGame: XCTestCase {
    
    var inputChecker: InputChecker!
    var ladderGame: LadderGame!
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        super.tearDown()
        
        inputChecker = nil
    }
    
    // MARK: InputChecker Test
    func testInputHeightSuccess() {
        inputChecker = InputChecker()
        
        let heightUnderTest = 5
        let names = ["pobi", "honux", "crong" ,"jk"]
        
        XCTAssertFalse(inputChecker.check(height: heightUnderTest, names: names))
    }
    
    func testInputHeightFailure() {
        inputChecker = InputChecker()
        
        let heightUnderTest = 0
        let names = ["pobi", "honux", "crong" ,"jk"]
        XCTAssertTrue(inputChecker.check(height: heightUnderTest, names: names))
    }
    
    func testInputNamesSuccess() {
        inputChecker = InputChecker()

        let height = 5
        let namesUnderTest = ["pobi", "honux", "crong" ,"jk"]
        
        XCTAssertFalse(inputChecker.check(height: height, names: namesUnderTest))
    }
    
    func testInputNamesFailure() {
        inputChecker = InputChecker()

        let height = 5
        let namesUnderTest = ["pobiii", "honuxxx", "crong" ,"jk"]
        
        XCTAssertTrue(inputChecker.check(height: height, names: namesUnderTest))
    }
    
    // MARK: LadderGame Test
    func testInitLadderGame() {
        let height = 5
        let names = ["pobi", "honux", "crong" ,"jk"]
        
        ladderGame = LadderGame(players: names, height: height)
        XCTAssertNotNil(ladderGame)
    }
    
    func testMakeLadderCount() {
        let height = 5
        let names = ["pobi", "honux", "crong" ,"jk"]
        ladderGame = LadderGame(players: names, height: height)
        
        let ladder: [[LadderStep]] = ladderGame.makeLadder()
        
        XCTAssertEqual(height, ladder.count)
    }
    
    // MARK: RepeatingChecker Test
    func testRepeatingCheckerOutputCount() {
        let height = 5
        let names = ["pobi", "honux", "crong" ,"jk"]
        ladderGame = LadderGame(players: names, height: height)
        
        let ladder: [[LadderStep]] = ladderGame.makeLadder()
        
        XCTAssertEqual(RepeatingChecker.removeRepeatLadder(origin: ladder).count, ladder.count)
    }
    
}
