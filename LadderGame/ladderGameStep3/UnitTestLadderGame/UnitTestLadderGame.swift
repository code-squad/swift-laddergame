//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by Choi Jeong Hoon on 2017. 11. 11..
//  Copyright © 2017년 JH Factory. All rights reserved.
//

import XCTest

class UnitTestLadderGame: XCTestCase {
    
    func testLadderOfGame() {
        let inputNames = ["hoon","pobi","jake","mine"]
        let inputHeight = 4
        let inputValue = (inputNames, inputHeight)
        let ladderGame = LadderGame(inputValues: inputValue)
        XCTAssertNotNil(ladderGame)
        XCTAssertNotNil(ladderGame.makeTwoDimentionalArray(inputHeight))
    }
    
    func testParticipantsOfLadderGame() {
        let inputNames = ["honux","pobi","jake","mine"]
        let inputHeight = 5
        let inputValue = (inputNames, inputHeight)
        let ladderGame = LadderGame(inputValues: inputValue)
        XCTAssertEqual(ladderGame.participant[0].name , "honux")
        XCTAssertNotNil(ladderGame.participant[3].name)
    }
}
