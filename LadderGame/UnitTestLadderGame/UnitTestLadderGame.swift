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
    var gameOption : GameOption!
    var ladderInfo : LadderInfo!
    
    func testGameOptionTestHeight () {
        let playerNames = ["Cat","Fox","Dog","Bird","Tiger"]
        let ladderHeight = 4
        let inputValue = (playerNames, ladderHeight)
        gameOption = GameOption(inputValue)
        
        XCTAssertEqual(gameOption.inputHeight, 4)
    }
    
    func testGameOptionTestPlayers () {
        let playerNames = ["Cat","Fox","Dog","Bird","Tiger"]
        let ladderHeight = 4
        let inputValue = (playerNames, ladderHeight)
        gameOption = GameOption(inputValue)
        XCTAssertEqual(gameOption.inputPlayerNames[1], "Fox")
    }
    
    func testLadderInfoTestRandomBarNums () {
        let playerNames = ["Cat","Fox","Dog","Bird","Tiger"]
        let ladderHeight = 4
        let inputValue = (playerNames, ladderHeight)
        gameOption = GameOption(inputValue)
        let ladderGame = LadderGame(gameOption)
        let ladderInfo : LadderInfo = ladderGame.genarateLadder()

        XCTAssertEqual(ladderInfo.randomBars.count, 4)
    }

    func testLadderInfoTestPlayers () {
        let playerNames = ["Cat","Fox","Dog","Bird","Tiger"]
        let ladderHeight = 4
        let inputValue = (playerNames, ladderHeight)
        gameOption = GameOption(inputValue)
        let ladderGame = LadderGame(gameOption)
        let ladderInfo : LadderInfo = ladderGame.genarateLadder()

        XCTAssertEqual(ladderInfo.playerNames[4], "Tiger")
    }
    
    
    

}
