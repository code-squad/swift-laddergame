//
//  main.swift
//  LadderGame
//
//  Created by Joon-ho Kil on 04/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

let inputView: InputView = InputView()
let resultView: ResultView = ResultView()
let maximumHeight: Int
let players: [LadderPlayer]

(players, maximumHeight) = inputView.input()
let ladderGame: LadderGame = LadderGame(height: maximumHeight, names: players)
let ladderBoolBoard = ladderGame.makeLadder(players.count, maximumHeight)
resultView.printLadder(players, ladderBoolBoard)


