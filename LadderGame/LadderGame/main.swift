//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

let players = InputView.players()
let height = InputView.heightOfLadder()

var ladderGame = LadderGame(players: players, ladders: height)
ladderGame.makeLadders()

let resultView = ResultView(ladderStairs: ladderGame.ladderStairs, players: ladderGame.playerNames)
resultView.printOutput()
