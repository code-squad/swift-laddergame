//
//  main.swift
//  Laddergame
//
//  Created by yangpc on 2017. 10. 16..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import Foundation

let input = InputView().read()
let play = LadderGame(inputs: input)
_ = ResultView(ladderGame: play)
