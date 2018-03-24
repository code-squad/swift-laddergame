//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//


import Foundation


func hasNumberZero(_ people: Int, _ height: Int) -> Bool {
    return (people == 0 || height == 0)
}

func drawLadder(_ ladder: [[Bool]]) {
    for row in ladder {
        print("|", terminator: "")
        drawBar(row)
        print()
    }
}

func drawBar(_ row: [Bool]) {
    for column in row {
        print(makeBar(element: column), terminator: "|")
    }
}

func makeBar(element: Bool) -> String {
    return element ? "-" : " "
}

func runLadderGame() {
    
    let inputView: InputView = InputView()
    
    inputView.ask(question: InputView.Question.namesOfPlayers)
    let namesOfPlayers: [String] = inputView.getNamesOfPlayers()
    
    inputView.ask(question: InputView.Question.heightOfLadder)
    let heightOfLadder: Int = inputView.getHeightOfLadder()
    
    let ladderPlayers: [LadderPlayer] = inputView.setLadderPlayers(by: namesOfPlayers)
    
    let ladderGame: LadderGame = LadderGame(names: ladderPlayers, height: heightOfLadder)
    
    let ladder: [[LadderStep]] = ladderGame.makeLadder()
    
    let unRepeatedLadder = RepeatingChecker().removeRepeatLadder(origin: ladder)
    
    let resultView = ResultView()
    
    resultView.drawLadder(unRepeatedLadder)
    
}


// MARK: Run a program.
runLadderGame()
