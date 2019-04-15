//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation


// build whole ladder according to height and number of player
func buildLadder(using userInput: UserInput) -> LadderGameBoard {
    var ladder: LadderGameBoard = Array(repeating: [Bool](), count: userInput.maxHeightOfLadder)
    
    for i in 0..<ladder.count {
        ladder[i] = createRow(for: userInput.numberOfPlayer)
    }
    
    return ladder
}

// create steps in one row with true or false, and return it
func createRow(for numberOfPlayer: Int) -> [Bool]{
    let ladderSteps: [Bool] = [true, false]
    let rowSize = numberOfPlayer - 1
    var ladderRow = Array(repeating: ladderSteps.randomElement()!, count: rowSize)
    
    for i in 1..<ladderRow.count {
        ladderRow[i] = ladderRow[i-1] ? false : ladderSteps.randomElement()!
    }
    return ladderRow
}

// print whole ladder
func printLadder(_ ladder: LadderGameBoard) {
    for row in ladder {
        printLadderBy(row)
    }
}

func printLadderBy(_ row: [Bool]) {
    let ladderSteps: [Bool: String] = [true: "-", false: " "]
    
    printRail()
    for step in row {
        print(ladderSteps[step]!, terminator: "")
        printRail()
    }
    print("")
}

func printRail() {
    let rail = "|"
    print(rail, terminator: "")
}


struct LadderGameController {
    
    func execute() {
        let inputView = InputView()
        let (namesOfPlayers, maxHeightOfLadder) = inputView.getUserInputForGame()
        // create LadderPlayer instances using namesOfPlayers
        // create LadderGame instance using LadderPlayer and maxHeightOfLadder
        // LadderGame.build()
        // print LadderGame.board
    }
}
