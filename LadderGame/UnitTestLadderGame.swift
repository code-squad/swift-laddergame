//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by KIMMINSIK on 2018. 8. 20..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.

import XCTest
@testable import LadderGame

class UnitTestLadderGame: XCTestCase {
    
    var ladderGameTest : LadderGame!
    
   
    override func setUp() {
        super.setUp()
    
        ladderGameTest = LadderGame.init(input: ["jobs", "JK", "zombi", "etux"], 5))
    }
    
    override func tearDown() {
        super.tearDown()
        
        ladderGameTest = nil
    }
    
    func testLadderGame() {
        XCTAssertNotNil(ladderGameTest)
    }
    
    func testMakeLadderElements() {
        let ladder = laddergameTest.(true)
        XCTAssertEqual(ladder, "-----")
    }

 
}
