//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func getUserInput() -> (numberOfParticipants: Int, heightOfLadder: Int)? {
    print("참여할 사람은 몇 명인가요?")
    guard let numberOfParticipants = Int(readLine()!) else { return nil }
    
    print("최대 사다리 높이는 몇 개인가요?")
    guard let heightOfLadder = Int(readLine()!) else { return nil }
    
    return (numberOfParticipants, heightOfLadder)
}

func createLadder(numberOfParticipants: Int, heightOfLadder: Int) -> [[String]] {
    let numberOfColumn = numberOfParticipants * 2 - 1
    let ladder = Array(repeating: Array(repeating: " ", count: numberOfColumn), count: heightOfLadder)
    
    return ladder
}

func getRandomPart() -> String {
    let randomPartNumber = arc4random_uniform(2)
    var randomParts: String
    
    if randomPartNumber == 0 {
        randomParts = " "
    } else {
        randomParts = "-"
    }
    
    return randomParts
}

func getLadderPart(columnNumber: Int) -> String {
    var ladderPart: String
    
    if columnNumber % 2 == 0 {
        ladderPart = "|"
    } else {
        ladderPart = getRandomPart()
    }
    
    return ladderPart
}

func configureLadder(_ ladder: inout [[String]]) {
    for (rowNumber, row) in ladder.enumerated() {
        for columnNumber in 0..<row.count {
            ladder[rowNumber][columnNumber] = getLadderPart(columnNumber: columnNumber)
        }
    }
}

func main() {
    guard let userInput = getUserInput() else { return }
    var ladder = createLadder(numberOfParticipants: userInput.numberOfParticipants, heightOfLadder: userInput.heightOfLadder)
    configureLadder(&ladder)
    
}

main()
