//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by rhino Q on 2018. 3. 16..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//
/* 사다리 step4
 1. Input.validCheck()
 
 2. LadderGame 초기화 후
 
 2.1 - LadderGame.names
 
 2.2 - LadderGame.heightOfLadder
 */
import XCTest
@testable import LadderGame

class UnitTestLadderGame: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testLadderGameValues(){
        let names = ["linseang","rhino","mason","drake"]
        let heightOfLadder = 5
        var ladderGame = LadderGame(names, heightOfLadder)
        var players = [LadderPlayer]()
        
        for name in names {
            players.append(LadderPlayer(name: name))
        }
        
        // 사다리 높이 테스트
        XCTAssertEqual(ladderGame.ladderGameDTO.heightOfLadder, heightOfLadder, "should be equal")
        // 이름 테스트
        for i in 0..<players.count {
            XCTAssertEqual(ladderGame.ladderGameDTO.names[i].name, players[i].name, "should be eaual")
        }
    }
    
    func test_validChecker_checkHeight(){
        XCTAssertEqual(ValidChecker.checkHeight(nil), 0, "should be 0")
        XCTAssertEqual(ValidChecker.checkHeight(""), 0, "should be 0")
        XCTAssertEqual(ValidChecker.checkHeight("sdf"), 0, "should be 0")
        XCTAssertEqual(ValidChecker.checkHeight("1"), 1, "should be 1")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
}
