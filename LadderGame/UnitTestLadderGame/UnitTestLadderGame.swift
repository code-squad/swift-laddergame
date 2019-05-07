//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by JH on 06/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class UnitTestLadderGame: XCTestCase {
    
    func testPlayerNameCount() {
        XCTAssertThrowsError(try showPlayerError(chNames: ["judy","ChrisH"]))
        XCTAssertNoThrow(try showPlayerError(chNames: ["judy","Chris"]))
    }
    
    func testPlayerCount() {
        XCTAssertThrowsError(try showPlayerError(chNames: ["judy"]))
        XCTAssertThrowsError(try showPlayerError(chNames: [" "]))
        XCTAssertNoThrow(try showPlayerError(chNames: ["judy","song"]))
        XCTAssertNoThrow(try showPlayerError(chNames: ["judy","song","min"]))
    }
    
    func testLadderHeigh() {
        XCTAssertThrowsError(try showLabberError(chladderNum: 0))
        XCTAssertNoThrow(try showLabberError(chladderNum: 1))
        XCTAssertNoThrow(try showLabberError(chladderNum: 6))
    }
    
    func testMakeStep() {
        let rawData = [true, false]
        XCTAssertEqual(LadderStep.makeStep(target: rawData, changeTargetIndex: 0), "-----", "step생성 실패")
        XCTAssertEqual(LadderStep.makeStep(target: rawData, changeTargetIndex: 1), "     ", "step생성 실패")
    }
}
