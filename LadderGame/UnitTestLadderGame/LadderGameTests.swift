//
//  LadderGameTests.swift
//  UnitTestLadderGame
//
//  Created by 이동건 on 19/07/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import XCTest

class LadderGameTests: XCTestCase {

    private var height:Int!
    private var ladderPlayer:[LadderPlayer]!
    private var applicants: Int!
    private var ladderGame: LadderGame!
    
    override func setUp() {
        height = 1
        ladderPlayer = [LadderPlayer(name: "testname"), LadderPlayer(name: "test")]
        applicants = ladderPlayer.count
        ladderGame = LadderGame(height: height, applicants: ladderPlayer)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        height = nil
        ladderPlayer = nil
    }
    
    func testInitializer(){
        XCTAssertNoThrow(LadderGame(height: height, applicants: ladderPlayer), "초기화 실패")
    }
    
    func testGenerateValidStage(){
        XCTAssertEqual(ladderGame.generateLadder().count, ladderPlayer.count - 1, "올바르지 않은 사다리 포맷")
    }
}
