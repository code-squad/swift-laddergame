//
//  main.swift
//  Laddergame
//
//  Created by yangpc on 2017. 10. 16..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import Foundation

let input = InputView()
let play = LadderGame(height: input.height, player: input.names)
_ = ResultView(ladderGame: play)
