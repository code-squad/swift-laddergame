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
    
    override func setUp() {
        let playerNames = ["Cat","Fox","Dog","Bird","Tiger"]
        let ladderHeight = 4
        let inputValue = (playerNames, ladderHeight)
        gameOption = GameOption(inputValue)
        ladderGame = LadderGame(gameOption.inputPlayerNames, gameOption.inputHeight)
        ladderInfo = LadderInfo(ladderGame.height,ladderGame.playerNamesInfo(), ladderGame.randomBarInfo())
        super.setUp()
    }
    
    func gameOptionTestHeight () {
        XCTAssertEqual(gameOption.inputHeight, 4)
    }
    
    func gameOptionTestPlayers () {
        XCTAssertEqual(gameOption.inputPlayerNames[1], "Fox")
    }
    
    func ladderInfoTestHeight () {
        XCTAssertEqual(ladderInfo.ladderHeight, 4)
    }
    
    func ladderInfoTestPlayers () {
        XCTAssertEqual(ladderInfo.playerNames[4], "Tiger")
    }
    
    
    

}
