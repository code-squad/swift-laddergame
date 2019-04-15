//
//  main.swift
//  LadderGame
//
//  Created by Joon-ho Kil on 04/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

var inputView: InputView = InputView()
inputView.input()
let resultView: ResultView = ResultView()
let ladderGame: LadderGame = LadderGame(inputView.maximumHeight, inputView.players)
let ladderBoolBoard = ladderGame.makeLadder(inputView.players.count, inputView.maximumHeight)
resultView.printLadder(inputView.players, ladderBoolBoard)




