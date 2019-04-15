//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

struct GameController {
    
    func executeLadderGame() {
        let inputView = InputView()
        let (namesOfPlayers, maxHeightOfLadder) = inputView.getUserInputForGame()
        let ladderGame = LadderGame(height: maxHeightOfLadder, playerNames: namesOfPlayers)
        
        let resultView = ResultView()
        resultView.printLadderGame(using: ladderGame)
    }
}

let gameController = GameController()

gameController.executeLadderGame()
