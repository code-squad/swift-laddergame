//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

typealias LadderGameBoard = [[String]]

enum InputError: Error {
    case invalidNumberOfPlayer
    case invalidHeightOfLadder
}

// get input from user and return tuple of converted input in Int
func getUserInputForGame() throws -> (Int, Int){
    print("참여할 사람 수: ")
    guard let numberOfPlayer = readLine(), let convertedNumber = Int(numberOfPlayer) else {
        throw InputError.invalidNumberOfPlayer
    }
    
    print("최대 사다리 높이: ")
    guard let heightOfLadder = readLine(), let convertedHeight = Int(heightOfLadder) else {
        throw InputError.invalidHeightOfLadder
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

// create a row with side rails and steps
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
    do {
        let (m, n) = try getUserInputForGame()
        let ladder: LadderGameBoard = buildLadder(ofMaxHeight: m, numberOfPlayer: n)
        printLadder(ladder)
    } catch {
        print("Error \(error)")
    }
}

executeLadderGame()

