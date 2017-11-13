
//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

var inputView = InputView()
var gameOption : GameOption = inputView.userInput()
var ladderGame = LadderGame(gameOption)
var ladderInfo : LadderInfo = ladderGame.genarateLadder()
var result = ResultView(ladderInfo)

result.printMainLadder()

