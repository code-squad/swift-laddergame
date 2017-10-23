//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

// 사다리 게임 세팅
func setLadderGame() -> LadderGame {
    var playerNames : [String.SubSequence]
    var ladderHeight : Int = 0
    repeat {
        playerNames = InputView.getPlayers()
        ladderHeight = InputView.getLadderHeight()
    } while(!(playerNames.count > 0) || !(ladderHeight > 0))
    var ladderGame : LadderGame = LadderGame(height: ladderHeight, names: [], ladder: [])
    ladderGame.makeLadderLayer(ladderHeight: ladderHeight, playerNames: playerNames)
    return ladderGame
}

let ladderGame = setLadderGame()
ResultView.printResult(result: ladderGame.ladder)
ResultView.printPlayers(players: ladderGame.names)

