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
    
    let ladderGameInfo = mainInputView.read()
    guard let names = ladderGameInfo.players, ladderGameInfo.row != 0 else { return }    //guard문 안에서 참이면 다음라인을 실행한다.
    gameValue.makeLadder(column: ladderGameInfo.column, row: ladderGameInfo.row)
    gameValue.makeRandomLine()
    let outView: ResultView = ResultView(information: gameValue.ladderInfo, names: names, nameLength: 5)
    outView.printLadder()
    print()
}

playLadderGame()
