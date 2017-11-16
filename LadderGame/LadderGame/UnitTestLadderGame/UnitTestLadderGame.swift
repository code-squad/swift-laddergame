//
//  UnitTestLadderGame.swift
//  UnitTestLadderGame
//
//  Created by Choi Jeong Hoon on 2017. 11. 11..
//  Copyright © 2017년 JH Factory. All rights reserved.
//

import XCTest

class UnitTestLadderGame: XCTestCase {
    func testIsCheckingValueCanThrowError () {
        let inputNames = Array<String>()
        let inputHeight = 0
        let valueData = ValueData(inputNames, inputHeight)
        XCTAssertThrowsError(try CheckingValue().returnResultOfChecking(valueData.names , valueData.heightOfLadder))
    }
    
    func testLadderOfGameisNotNil() {
        let inputNames = ["hoon","pobi","jake","mine"]
        let inputHeight = 5
        let valueData = ValueData(inputNames,inputHeight)
        let ladderGame = LadderGame(inputValues: (valueData.names,valueData.heightOfLadder))
        XCTAssertNotNil(ladderGame)
    }
    
    func testHeightOfLadderIsEqual () {
        let inputNames = ["hoon","pobi","jake","mine"]
        let inputHeight = 5
        let valueData = ValueData(inputNames,inputHeight)
        let ladderGame = LadderGame(inputValues: (valueData.names,valueData.heightOfLadder))
        XCTAssertEqual(ladderGame.makeTwoDimentionalArray(ladderGame.participant.count, ladderGame.height).count, 5)
    }
    
    func testHeightOfLadderisNotEqual () {
        let inputNames = ["hoon","pobi","jake","mine"]
        let inputHeight = 5
        let valueData = ValueData(inputNames,inputHeight)
        let ladderGame = LadderGame(inputValues: (valueData.names,valueData.heightOfLadder))
        XCTAssertNotEqual(ladderGame.makeTwoDimentionalArray(ladderGame.participant.count, ladderGame.height).count, 6)
    }
}
