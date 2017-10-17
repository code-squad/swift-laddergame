//
//  main.swift
//  Laddergame
//
//  Created by yangpc on 2017. 10. 16..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import Foundation

var inputView = InputView()
let inputs = inputView.read()

let game = LadderGame(inputs: inputs)
let ladder = game.makeLadder()

let resultView = ResultView()
resultView.result(ladder: ladder, names: game.names)
