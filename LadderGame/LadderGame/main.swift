//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

typealias LadderGameSetter = (playerNames: [String.SubSequence], ladderHeight: Int)

// 사다리 게임 세팅
func setLadderGame() -> LadderGame {
    
    // 새로운 사다리 게임을 위해 입력값 받기
    let ladderGameSetter : LadderGameSetter = InputView.setNewGame()
    // 사다리 게임 필수 값 지정
    let playerNames : [String.SubSequence] = ladderGameSetter.playerNames
    let ladderHeight : Int = ladderGameSetter.ladderHeight
    var ladderGame : LadderGame = LadderGame(height: ladderHeight, names: [], ladder: [])
    // 입력된 값을 이용해 사다리게임 만들기
    ladderGame.makeLadderLayer(playerNames: playerNames)
    return ladderGame
}

let ladderGame = setLadderGame()
ResultView.printResult(result: ladderGame.ladder)
ResultView.printPlayers(players: ladderGame.names)

