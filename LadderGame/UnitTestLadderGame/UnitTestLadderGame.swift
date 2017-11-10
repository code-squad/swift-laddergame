//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by YOUTH on 2017. 11. 10..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import XCTest


class UnitTestLadderGame: XCTestCase {
    var ladderGame : LadderGame!
    var ladderPlayer : LadderPlayer!
    
    override func setUp() {
        let inputNames = ["Rabbit","Cat","Fox","Dog"]
        let inputHeight = 5
        let inputValue = (inputNames, inputHeight)
        ladderGame = LadderGame(inputValue)
        super.setUp()
    }
    
    func testLadderHeight () {
        XCTAssertEqual(ladderGame.height, 5)
    }
    
    func testPlayerNames () {
        XCTAssertEqual(ladderGame.players[1].name, "Cat")
    }
    
    
}
