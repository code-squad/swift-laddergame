//
//  ladderGameTest.swift
//  ladderGameTest
//
//  Created by 이희찬 on 09/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class ladderGameTest: XCTestCase {
    
    func testIsContinue() {
        for _ in 1...200{
            isContinue()
        }
    }

    func isContinue() {
        let playerNumber = Int.random(in: 2..<100)
        let ladderHeight = Int.random(in: 2..<100)
        var ladder = ladderBoard(playerNumber,ladderHeight)
        ladder.markLadder()
        for x in 0..<ladderHeight{
            for y in 0..<playerNumber-2{
                XCTAssertFalse((ladder.widthLadderIsExistence[x][y] == true) && (ladder.widthLadderIsExistence[x][y+1] == true))
            }
        }
    }


}
