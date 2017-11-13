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
    
    func gameOptionTestHeight () {
        let playerNames = ["Cat","Fox","Dog","Bird","Tiger"]
        let ladderHeight = 4
        let inputValue = (playerNames, ladderHeight)
        gameOption = GameOption(inputValue)
        
        XCTAssertEqual(gameOption.inputHeight, 4)
    }
    
    func gameOptionTestPlayers () {
        let playerNames = ["Cat","Fox","Dog","Bird","Tiger"]
        let ladderHeight = 4
        let inputValue = (playerNames, ladderHeight)
        gameOption = GameOption(inputValue)
        XCTAssertEqual(gameOption.inputPlayerNames[1], "Fox")
    }

//    func ladderInfoTestHeight () {
//        XCTAssertEqual(ladderInfo.ladderHeight, 4)
//    }
//
//    func ladderInfoTestPlayers () {
//        XCTAssertEqual(ladderInfo.playerNames[4], "Tiger")
//    }
    
    
    

}
