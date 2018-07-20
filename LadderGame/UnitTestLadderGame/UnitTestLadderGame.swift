//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by oingbong on 2018. 7. 20..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import XCTest
import Foundation

@testable import LadderGame

class UnitTestLadderGame: XCTestCase {
    
    func testMain(){
        XCTAssertNoThrow(main())
    }
    
    func testswitchHaveLadderValue(){
        let value = switchHaveLadderValue(value: 0)
        XCTAssertEqual(1, value)
    }
    
    func testVerifyDuplication(){
        let haveLadderStep:LadderStep = LadderStep.have
        let noneLadderStep:LadderStep = verifyDuplication(first: haveLadderStep, second: haveLadderStep, select: 1)
        XCTAssertNotEqual(haveLadderStep, noneLadderStep)
    }
    
    func testMakeStep(){
        XCTAssertNoThrow(makeStep(elements: 1))
    }
    
    func testMakeLadder(){
        let player1 = LadderPlayer.init(name: "oing1")
        let player2 = LadderPlayer.init(name: "oing2")
        var players:Array<LadderPlayer> = Array<LadderPlayer>()
        players.append(player1)
        players.append(player2)
        let ladderGame = LadderGame.init(names: players, height: 2)
        XCTAssertNoThrow(makeLadder(elements: ladderGame))
    }
    
    func testHaveHorizontalLadder(){
        let haveLadderStep:LadderStep = LadderStep.have
        let noneLadderStep:LadderStep = LadderStep.none
        let ladderStep1 = haveHorizontalLadder(have: 1)
        let ladderStep0 = haveHorizontalLadder(have: 0)
        XCTAssertEqual(haveLadderStep, ladderStep1)
        XCTAssertEqual(noneLadderStep, ladderStep0)
    }
    
}
