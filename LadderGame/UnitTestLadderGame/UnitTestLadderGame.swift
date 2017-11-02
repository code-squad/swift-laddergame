//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by yuaming on 2017. 11. 2..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import XCTest

@testable import LadderGame

class UnitTestLadderGame: XCTestCase {
    var userNames: String = "hj,sj,gamja,woong"
    var ladderHeight: String = "5"
    var gameResult: LadderGameInformation?
    
    override func setUp() {
        super.setUp()
        gameResult = LadderGame.startGame(userNames: userNames, ladderHeight: ladderHeight)
    }
    
    override func tearDown() {
        super.tearDown()
        gameResult = nil
    }
    
    func testGameResultIsNotNil() {
        XCTAssertNotNil(gameResult)
    }
    
    func testGameResultColumnIsNotZero() {
        XCTAssertNotEqual(0, gameResult!.result.column)
    }
    
    func testGameResultColumnEqualsUserNamesCount() {
        XCTAssertEqual(userNames.split(separator: ",").count, gameResult!.result.column)
    }
    
    func testGameResultRowIsNotZero() {
        XCTAssertNotEqual(0, gameResult!.result.row)
    }
    
    func testGameResultLadderIsNotNil() {
        XCTAssertTrue(gameResult!.result.ladder != "", "사다리은 빈 값이 아닙니다.")
    }
    
    func testLadderPlayerExceedLength() {
        XCTAssertFalse(LadderPlayer(name: "yuaming").isExceedLength, "유저 이름이 5자리 넘습니다.")
    }
    
    func testLadderIsNotNil() {
        let ladder: Ladder = Ladder(column: userNames.split(separator: ",").count, row: Int(ladderHeight) ?? 0).makeLadder()
        XCTAssertTrue(ladder.ladder != "", "Ladder객체의 ladder는 빈 값이 아닙니다.")
    }
    
    func testLadderGameCheckGettingPlayerNames() {
        XCTAssertTrue(gameResult!.playerNames.count > 0, "플레이어 이름을 가져옵니다.")
    }
}
