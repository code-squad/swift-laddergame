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
    let namesOfPlayers: [String] = inputView.getNamesOfPlayers()
    
    InputView.ask(question: InputView.Question.heightOfLadder)
    let heightOfLadder: Int = inputView.getHeightOfLadder()
    
    let ladderPlayers: [LadderPlayer] = inputView.setLadderPlayers(by: namesOfPlayers)
    
    let ladderGame: LadderGame = LadderGame(names: ladderPlayers, height: heightOfLadder)

    let ladder: [[LadderStep]] = ladderGame.makeLadder()

    let unRepeatedLadder = RepeatingChecker().removeRepeatLadder(origin: ladder)

    let resultView = ResultView()

    resultView.drawLadder(unRepeatedLadder)
    resultView.printNamesOf(ladderPlayers)
}


// MARK: Run a program.
runLadderGame()
