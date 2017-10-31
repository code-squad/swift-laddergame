//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//
import Foundation

func playLadderGame(){
    let inputView: InputView = InputView()
    var gameValue: LadderGame = LadderGame()
    var resultView: ResultView = ResultView()
    
    let gameInfo = inputView.read()
    gameValue.makeLadder(gameInfo)
    resultView.printLadder(gameValue)
    print()
}

playLadderGame()
