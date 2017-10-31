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
    let gameInfo = inputView.read()
    let gameValue: LadderGame = LadderGame(gameInfo)
    ResultView.printLadder(gameValue)
    print()
}

playLadderGame()
