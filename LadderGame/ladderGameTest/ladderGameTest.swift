//
//  ladderGameTest.swift
//  ladderGameTest
//
//  Created by 이희찬 on 09/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class ladderGameTest: XCTestCase {
    
    func testRepeat() {
        for _ in 1...200{
           testIsContinue()
        }
    }

    func testIsContinue() {
        let playerNumber = Int.random(in: 2..<200)
        let ladderHeight = Int.random(in: 2..<200)
        var ladder = ladderBoard(playerNumber ,ladderHeight)
        ladder.markLadder()
        for x in 0..<ladderHeight{
            for y in 0..<playerNumber-2{
                XCTAssertFalse((ladder.widthLadderIsExistence[x][y] == true) && (ladder.widthLadderIsExistence[x][y+1] == true))
            }
        }
    }
    
    func testPlayerNumberOverRange() {
        let ladder = ladderBoard(200,5)
        XCTAssertThrowsError(try ladder.playerNumberCheck())
    }
    
    func testPlayerNumberInRange() {
        let ladder = ladderBoard(199,5)
        XCTAssertNoThrow(try ladder.playerNumberCheck())
    }
    
    func testLaderHeightOverRange() {
        let ladder = ladderBoard(5,200)
        XCTAssertThrowsError(try ladder.ladderHeightCheck())
    }
    
    func testLaderHeightInRange() {
        let ladder = ladderBoard(5,199)
        XCTAssertNoThrow(try ladder.ladderHeightCheck())
    }
}
