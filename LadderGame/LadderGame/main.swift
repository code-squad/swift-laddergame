//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//


import Foundation


func runLadderGame() {
    
    let inputView: InputView = InputView()
    
    InputView.ask(question: InputView.Question.namesOfPlayers)
    let namesOfPlayers: [LadderPlayer] = inputView.getNamesOfPlayers().map{ LadderPlayer(name: $0) }
    
    InputView.ask(question: InputView.Question.heightOfLadder)
    let heightOfLadder: Int = inputView.getHeightOfLadder()

    let ladderGame: LadderGame = LadderGame(names: namesOfPlayers, height: heightOfLadder)

    let ladder: [[LadderStep]] = ladderGame.makeLadder()

    let nonRepeatedLadder = RepeatingChecker.removeRepeatLadder(origin: ladder)

    let resultView = ResultView()

    resultView.drawLadder(nonRepeatedLadder)
    resultView.printPlayerName(ladderGame.names)
}


// MARK: Run a program.
runLadderGame()
