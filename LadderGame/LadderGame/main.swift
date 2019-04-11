//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

///입력 함수
func getUserInput() -> (numberOfParticipants: Int, heightOfLadder: Int)? {
    print("참여할 사람은 몇 명인가요?")
    guard let numberOfParticipants = Int(readLine()!) else { return nil }
    
    print("최대 사다리 높이는 몇 개인가요?")
    guard let heightOfLadder = Int(readLine()!) else { return nil }
    
    guard numberOfParticipants > 0 || heightOfLadder > 0 else { return nil }
    
    return (numberOfParticipants, heightOfLadder)
}

///사다리 생성 함수
func createLadder(numberOfParticipants: Int, heightOfLadder: Int) -> [[String]] {
    let numberOfColumn = numberOfParticipants * 2 - 1
    let ladder = Array(repeating: Array(repeating: " ", count: numberOfColumn), count: heightOfLadder)
    
    return ladder
}

///사다리 부품 랜덤 반환
func getRandomPart() -> String {
    let randomPartNumber = arc4random_uniform(2)
    var randomPart: String
    
    if randomPartNumber == 0 {
        randomPart = " "
    } else {
        randomPart = "-"
    }
    
    return randomPart
}

//열에 따른 부품 반환
func getLadderPart(columnNumber: Int) -> String {
    var ladderPart: String
    
    if columnNumber % 2 == 0 {
        ladderPart = "|"
    } else {
        ladderPart = getRandomPart()
    }
    
    return ladderPart
}

///사다리 구성 함수
func configureLadder(_ ladder: inout [[String]]) {
    for (rowNumber, row) in ladder.enumerated() {
        for columnNumber in 0..<row.count {
            ladder[rowNumber][columnNumber] = getLadderPart(columnNumber: columnNumber)
        }
    }
}

///사다리 출력 함수
func printLadder(_ ladder: [[String]]) {
    for row in ladder {
        print(row.joined())
    }
}

//시작 함수
func main() {
    guard let userInput = getUserInput() else { return }
    var ladder = createLadder(numberOfParticipants: userInput.numberOfParticipants, heightOfLadder: userInput.heightOfLadder)
    configureLadder(&ladder)
    printLadder(ladder)
}

main()
