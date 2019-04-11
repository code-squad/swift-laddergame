//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

///입력 함수
func getUserInput() -> (participantCount: Int, ladderHeight: Int)? {
    print("참여할 사람은 몇 명인가요?")
    guard let participantCount = Int(readLine()!) else { return nil }
    
    print("최대 사다리 높이는 몇 개인가요?")
    guard let ladderHeight = Int(readLine()!) else { return nil }
    
    guard participantCount > 0 || ladderHeight > 0 else { return nil }
    
    return (participantCount, ladderHeight)
}

///사다리 생성 함수
func createLadder(participantCount: Int, ladderHeight: Int) -> [[Bool]] {
    let columnSize = participantCount * 2 - 1
    let ladder = Array(repeating: Array(repeating: false, count: columnSize), count: ladderHeight)
    
    return ladder
}

///열에 따른 부품 반환
func getLadderPart(columnNumber: Int) -> Bool {
    var ladderPart = true
    
    if columnNumber % 2 != 0 {
        ladderPart = Bool.random()
    }
    
    return ladderPart
}

///사다리 구성 함수
func configureLadder(_ ladder: inout [[Bool]]) {
    for (rowNumber, row) in ladder.enumerated() {
        for columnNumber in 0..<row.count {
            ladder[rowNumber][columnNumber] = getLadderPart(columnNumber: columnNumber)
        }
    }
}

///true, false에 따라 사다리 부품 구별
func distinguishPart(columnNumber: Int, columnValue: Bool) -> String {
    if columnNumber % 2 == 0 {
        return "|"
    }
    
    if columnValue {
        return "-"
    } else {
        return " "
    }
}

///사다리 출력 함수
func printLadder(_ ladder: [[Bool]]) {
    var ladderText = ""
    
    for row in ladder {
        for (columnNumber, columnValue) in row.enumerated() {
            ladderText.append(distinguishPart(columnNumber: columnNumber, columnValue: columnValue))
        }
        
        ladderText.append("\n")
    }
    
    print(ladderText)
}

//시작 함수
func main() {
    guard let userInput = getUserInput() else { return }
    var ladder = createLadder(participantCount: userInput.participantCount, ladderHeight: userInput.ladderHeight)
    configureLadder(&ladder)
    printLadder(ladder)
}

main()
