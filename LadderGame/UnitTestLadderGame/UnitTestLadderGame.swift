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
    var inputNames: [String]!
    
    override func setUp() {
        super.setUp()
        inputNames = ["jk", "pobi", "crong", "honux", "pobicrong"]
        ladderGame = LadderGame.readyLadder(for: inputNames, with: 7)!
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
    
    func testNameOverMaxExistAsPlayer(){
        for name in ladderGame.names{
            XCTAssertNotEqual(name.name, inputNames[4])
        }
    }
    
    func 
}
