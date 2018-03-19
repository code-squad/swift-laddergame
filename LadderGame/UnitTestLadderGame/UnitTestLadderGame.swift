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
        var ladderPlayer = LadderPlayer()
        for name in names {
            ladderPlayer.name = name
            players.append(ladderPlayer)
        }
        
        // 사다리 높이 테스트
        XCTAssertEqual(ladderGame.ladderGameDTO.heightOfLadder, heightOfLadder, "should be equal")
        
        // 이름 테스트
        for i in 0..<players.count {
            XCTAssertEqual(ladderGame.ladderGameDTO.names[i].name, players[i].name, "should be eaual")
        }
        
        
        // makeLadder() 테스트 준비
        ladderGame.makeLadder()

        // makeLadder() 후 numberOfLadder 테스트
        //  ladderGame.ladderGameDTO.numberOfLadder  와 ( heightOfLadder + names.count ) / 2
        XCTAssertEqual(ladderGame.ladderGameDTO.numberOfLadder, (heightOfLadder + names.count) / 2, "should be equal")
        
        // makeLadder() 후 ladderMatrix 테스트
        var allCount = 0
        var trueCount = 0
        for row in ladderGame.ladderGameDTO.ladderMatrix{
            for col in row {
                allCount += 1
                if col == true { trueCount += 1 }
            }
        }
        //  ladderGame.ladderGameDTO.ladderMatrix의 크기와 heightOfLadder * (names.count - 1)
        XCTAssertEqual(allCount, heightOfLadder * ( names.count - 1 ), "Should be equal")
        
        //  ladderGame.ladderGameDTO.ladderMatirx의 true의 개수가 ( heightOfLadder + names.count ) / 2 와 같은지
        XCTAssertEqual(trueCount, (heightOfLadder + names.count ) / 2, "Should be equal")
        
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
