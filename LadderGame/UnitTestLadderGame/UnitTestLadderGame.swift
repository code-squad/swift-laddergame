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
    var userNames: String  = "hj,sj,gamja,woong"
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
    
    func testGameResultLadderIsNotValue() {
        XCTAssertFalse(gameResult!.result.ladder == "")
    }
}
