//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation


func startGame() throws {
    let input = InputView()
    let player = try input.readNames()
    let height = try input.readHeight()
    let ladderGame = LadderGame.init(names: player, height: height)
    let result = ResultView.init(game: ladderGame, numberOfStep: 5)
    result.drawLadder()
    result.printNames()
}

do {
    try startGame()
} catch let err as UserInputError {
    print(err.description) //switch 문으로 error case에 맞게 출력
}
