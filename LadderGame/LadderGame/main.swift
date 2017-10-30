//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//
import Foundation

func playLadderGame(){
    let mainInputView: InputView = InputView()
    var gameValue: LadderGame = LadderGame()
    var outView: ResultView = ResultView()
    
    let ladderGameInfo = mainInputView.read()
    guard let names = ladderGameInfo.players, ladderGameInfo.row != 0 else { return }    //guard문 안에서 참이면 다음라인을 실행한다.
    
    gameValue.makeLadder(column: ladderGameInfo.column, row: ladderGameInfo.row)
    gameValue.makeRandomLine()
    
    outView.playerNames = names
    outView.ladderInfo.rowNumber = gameValue.ladderInfo.rowNumber
    outView.ladderInfo.columnNumber = gameValue.ladderInfo.columnNumber
    outView.nameLength = 5
    outView.ladderInfo.frames = gameValue.ladderInfo.frames
    
    outView.printLadder()
    print()
}

playLadderGame()
