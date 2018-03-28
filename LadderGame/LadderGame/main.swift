//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//


import Foundation


func runLadderGame() {
    
    let inputChecker: InputChecker = InputChecker()
    
    let namesOfPlayers: [String] = InputView.getNamesOfPlayers()
    let heightOfLadder: Int = InputView.getHeightOfLadder()
    
    if inputChecker.check(height: heightOfLadder, names: namesOfPlayers) {
        return
    }

    let ladderGame: LadderGame = LadderGame(players: namesOfPlayers, height: heightOfLadder)
    let ladder: [[LadderStep]] = ladderGame.makeLadder()

    ResultView.drawLadder(ladder)
    ResultView.printPlayerNames(namesOfPlayers)
}


// MARK: Run a program.
runLadderGame()
