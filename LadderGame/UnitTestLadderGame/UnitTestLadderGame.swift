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
    var ladderInfo : LadderInfo!
    var inputView : InputView!
    var gameOption : GameOption!
    
    func testHeight () {
        let playerNames = ["Cat","Fox","Dog","Bird","Tiger"]
        let ladderHeight = 4
        let inputValue = (playerNames, ladderHeight)
        gameOption = GameOption(inputValue)
        ladderGame = LadderGame(gameOption)
        ladderInfo = ladderGame.genarateLadder()
        XCTAssertEqual(ladderInfo.ladderHeight, 4)
    }
    
    func testPlayers () {
        let playerNames = ["Cat","Fox","Dog","Bird","Tiger"]
        let ladderHeight = 4
        let inputValue = (playerNames, ladderHeight)
        gameOption = GameOption(inputValue)
        ladderGame = LadderGame(gameOption)
        ladderInfo = ladderGame.genarateLadder()
        XCTAssertEqual(ladderInfo.playerNames.count, 5)
        XCTAssertNotNil(ladderInfo.playerNames[2])
    }

    func testRandomBarNums () {
        let playerNames = ["Cat","Fox","Dog","Bird","Tiger"]
        let ladderHeight = 4
        let inputValue = (playerNames, ladderHeight)
        gameOption = GameOption(inputValue)
        ladderGame = LadderGame(gameOption)
        ladderInfo = ladderGame.genarateLadder()
        var count : Int = 0
        for i in 0..<ladderInfo.randomBars.count {
            for _ in 0..<ladderInfo.randomBars[i].count {
                count += 1
            }
        }
    XCTAssertEqual(count, 16)
    }
    

}
