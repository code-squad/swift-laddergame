//
//  UnitTestLadderGame.swift
//  LadderGame
//
//  Created by KIMMINSIK on 2018. 8. 20..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import XCTest

class UnitTestLadderGame: XCTestCase {
    
    var ladderGameTest : LadderGame!
    
    func testLadderGame() {
        let players = ["jobs","JK","tux"]
        let height = 3
        ladderGameTest = LadderGame.init(input: ([String], Int))
    }
}
