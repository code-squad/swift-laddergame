
//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

var inputView = InputView()
var ladderGame = LadderGame()
var result = ResultView()


ladderGame.setGameOption(inputView.userInput())
result.printLadder(mainLadder: ladderGame.generateLadder(),playersName: ladderGame.playersTag())

