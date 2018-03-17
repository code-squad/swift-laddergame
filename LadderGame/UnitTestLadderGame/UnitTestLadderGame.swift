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
    var ladderGame:LadderGame!
    var players = [LadderPlayer]()
    
    //모든 테스트 함수에서 공통으로 쓰는 Figure 값들은 setUp에서 만들어도 됩니다만
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let names = ["linseang","rhino","mason","drake"]
        let heightOfLadder = 5
        ladderGame = LadderGame(names, heightOfLadder)
        
        for name in names {
            players.append(LadderPlayer(name: name))
        }
    }
    
    func testLadderGameValues(){
        XCTAssertEqual(ladderGame.heightOfLadder, 5, "should be equal")
        for i in 0..<players.count {
            XCTAssertEqual(ladderGame.names[i].name, players[i].name, "should be eaual")
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
