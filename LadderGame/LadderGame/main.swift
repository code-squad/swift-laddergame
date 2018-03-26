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
    
    let players: [LadderPlayer] = InputView.getNamesOfPlayers().map{ LadderPlayer(name: $0) }
    let heightOfLadder: Int = InputView.getHeightOfLadder()
    
    if inputChecker.check(height: heightOfLadder, players: players) {
        return
    }

    let ladderGame: LadderGame = LadderGame(players: players, height: heightOfLadder)
    let ladder: [[LadderStep]] = ladderGame.makeLadder()
    let nonRepeatedLadder = RepeatingChecker.removeRepeatLadder(origin: ladder)

    ResultView.drawLadder(nonRepeatedLadder)
    ResultView.printPlayerNames(players)
}


// MARK: Run a program.
runLadderGame()
