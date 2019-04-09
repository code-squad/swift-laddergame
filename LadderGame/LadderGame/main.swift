//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

typealias LadderGameBoard = [[String]]

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
func buildLadder(ofMaxHeight height: Int, numberOfPlayer: Int) -> LadderGameBoard {
    var ladder: LadderGameBoard = Array(repeating: [String](), count: height)
    
    for i in 0..<ladder.count {
        ladder[i] = createRow(for: numberOfPlayer)
    }
    
    return ladder
}

// create row with side rail and step
func createRow(for numberOfPlayer: Int) -> [String]{
    let rowSize = 2 * numberOfPlayer - 1
    var ladderRow = Array(repeating: "|", count: rowSize)
    
    for i in stride(from: 1, to: rowSize, by: 2) {
        ladderRow[i] = getRandomStep()
    }
    return ladderRow
}

// return step - blank or "-"
func getRandomStep() -> String {
    let ladderSteps = [" ", "-"]
    return ladderSteps.randomElement()!
}

func printLadder(_ ladder: LadderGameBoard) {
    for (i, row) in ladder.enumerated() {
        for j in 0..<row.count {
            print(ladder[i][j], terminator: "")
        }
        print("")
    }
}

func executeLadderGame() {
    let (m, n) = getUserInputForGame()
    let ladder: LadderGameBoard = buildLadder(ofMaxHeight: m, numberOfPlayer: n)
    printLadder(ladder)
}

executeLadderGame()

