//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by 심 승민 on 2017. 10. 24..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import XCTest
@testable import LadderGame

class UnitTestLadderGame: XCTestCase {
    
    var ladderGame: LadderGame!
    var transverseLine: [[Bool]]?
    
    override func setUp() {
        super.setUp()
        ladderGame = LadderGame.readyLadder(for: ["jk", "pobi", "crong", "honux"], with: 7)!
        transverseLine = ladderGame.makeTransverLine()
    }
    
    override func tearDown() {
        super.tearDown()
        ladderGame = nil
    }
    
    func testGameIsNotNil(){
        XCTAssertNotNil(ladderGame)
    }
    
    func testTransverseLineNotNil(){
        XCTAssertNotNil(transverseLine)
    }
    
    func testPlayerNamesAreUnderMax(){
        for name in ladderGame.names{
            XCTAssertFalse(name.isNameOverMaxCount)
        }
    }
    
    
}
