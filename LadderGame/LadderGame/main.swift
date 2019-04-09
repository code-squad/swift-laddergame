//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

var ladder = [[String]]()

// get input from user and return result tuple
func getUserInputForGame() -> (Int, Int){
    print("참여할 사람 수: ")
    let numberOfPlayer = readLine()
    
    print("최대 사다리 높이: ")
    let maxLadderHeight = readLine()
    
    guard let convertedNumber = Int(numberOfPlayer!), let convertedHeight = Int(maxLadderHeight!) else {
        fatalError("잘못된 입력입니다.")
    }
    
    return (convertedHeight, convertedNumber)
}

// build whole ladder according to height and number of player
func buildLadder(ofMaxHeight height: Int, numberOfPlayer: Int) {
    let blankStep: String = " "
    let row = Array(repeating: blankStep, count: 2 * numberOfPlayer - 1)
    ladder = Array(repeating: row, count: height)
    
    for i in 0..<ladder.count {
        drawLadderBy(row: &ladder[i])
    }
}

// draw side rail or step
func drawLadderBy(row: inout [String]) {
    for i in 0..<row.count {
        if i % 2 == 0 {
            row[i] = "|"
        } else {
            row[i] = getRandomStep()
        }
    }
}

// return step - blank or "-"
func getRandomStep() -> String {
    let ladderSteps = [" ", "-"]
    return ladderSteps.randomElement()!
}

func printLadder() {
    for (i, row) in ladder.enumerated() {
        for j in 0..<row.count {
            print(ladder[i][j], terminator: "")
        }
        print("")
    }
}

func executeLadderGame() {
    let (m, n) = getUserInputForGame()
    buildLadder(ofMaxHeight: m, numberOfPlayer: n)
    printLadder()
}

executeLadderGame()

