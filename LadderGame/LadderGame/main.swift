//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

typealias LadderGameBoard = [[Bool]]

struct UserInput {
    let numberOfPlayer: Int
    let maxHeightOfLadder: Int
    
    init(_ numberOfPlayer: Int, _ maxHeightOfLadder: Int) {
        self.numberOfPlayer = numberOfPlayer
        self.maxHeightOfLadder = maxHeightOfLadder
    }
}

enum InputError: Error {
    case invalidNumberOfPlayer
    case invalidHeightOfLadder
}

// get input from user and return tuple of converted input in Int
func getUserInputForGame() throws -> UserInput {
    guard let numberOfPlayer = getUserAnswerTo(question: "참여할 사람 수: ") else {
        throw InputError.invalidNumberOfPlayer
    }
    if numberOfPlayer <= 1 { throw InputError.invalidNumberOfPlayer }
    guard let maxHeightOfLadder = getUserAnswerTo(question: "최대 사다리 높이") else {
        throw InputError.invalidHeightOfLadder
    }
    
    return UserInput(numberOfPlayer, maxHeightOfLadder)
}

// print question and convert input String into Int
func getUserAnswerTo(question: String) -> Int? {
    print(question)
    guard let userInput = readLine(), let convertedInput = Int(userInput) else {
        return nil
    }
    return convertedInput
}

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

func executeLadderGame() {
    let userInput: UserInput!
    do {
        userInput = try getUserInputForGame()
    } catch {
        print("Error: \(error)")
        return
    }
    let ladder: LadderGameBoard = buildLadder(using: userInput)
    printLadder(ladder)
}

executeLadderGame()

