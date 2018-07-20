//
//  LadderGameTests.swift
//  UnitTestLadderGame
//
//  Created by 이동건 on 19/07/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import XCTest

class LadderGameTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        
    }
    
    func testInitializer(){
        var height = 1
        var ladderPlayer = [LadderPlayer(name: "testname"), LadderPlayer(name: "test")]
        XCTAssertNil(LadderGame(height: height, applicants: ladderPlayer), "초기화 실패")
        
        height = 0
        XCTAssertNil(LadderGame(height: height, applicants: ladderPlayer), "초기화 실패")
        
        height = 1
        ladderPlayer = []
        XCTAssertNil(LadderGame(height: height, applicants: ladderPlayer), "초기화 실패")
        
        height = 0
        ladderPlayer = []
        XCTAssertNil(LadderGame(height: height, applicants: ladderPlayer), "초기화 실패")
    }
    
    func testGenerateValidStage(){
        
        let height = 1
        let ladderPlayer = [LadderPlayer(name: "testname"), LadderPlayer(name: "test")]
        let ladderGame = LadderGame(height: height, applicants: ladderPlayer)
        
        XCTAssertEqual(ladderGame?.generateLadder().count, ladderPlayer.count - 1, "올바르지 않은 사다리 포맷")
    }
}
