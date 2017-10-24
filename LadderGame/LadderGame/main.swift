//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

// 사다리게임을 위한 세팅타입 정의
typealias LadderGameSetter = (playerNames: [LadderPlayer], ladderHeight: Int)

// 사다리 게임 세팅
func setLadderGame() -> LadderGame {
    // 새로운 사다리 게임을 위해 입력값 받기
    let ladderGameSetter : LadderGameSetter = InputView.setNewGame()
    // 사다리 게임 인스턴스 생성
    var ladderGame : LadderGame = LadderGame(height: ladderGameSetter.ladderHeight, names: ladderGameSetter.playerNames)
    // 입력된 값을 이용해 사다리게임 만들기
    ladderGame.makeLadderLayer()
    return ladderGame
}

let ladderGame = setLadderGame()
ResultView.printResult(result: ladderGame)

