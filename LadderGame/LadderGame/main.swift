//
//  main.swift
//  LadderGame
//
//  Created by Joon-ho Kil on 04/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

/// 사용자로부터 입력받는 함수
func inputFromUser (variableName: String) -> (Int) {
    print("\(variableName) : ", terminator: "")
    let optionalInput = readLine()
    var inputNumber = 0
    if let stringInput = optionalInput {
        inputNumber = Int(stringInput) ?? 0
    }
    if variableName == "numberOfPeopleToParticipate" {
        inputNumber -= 1
    }
    return inputNumber
}

/// 사다리를 만들고 저장하는 함수
func makeLadder (_ numberOfPeopleToParticipate: Int, _ maximumLadderHeight: Int) -> [[Bool]] {
    var ladderBoolBoard : [[Bool]] = Array(repeating: Array(repeating: false, count:numberOfPeopleToParticipate), count: maximumLadderHeight)
    
    for heightIndex in 0..<maximumLadderHeight {
        ladderBoolBoard[heightIndex] = makeLadderRow(numberOfPeopleToParticipate)
    }
    
    return ladderBoolBoard
}

/// 사다리 한줄을 만드는 함수
func makeLadderRow (_ numberOfPeopleToParticipate: Int) -> [Bool] {
    var ladderBoolRow : [Bool] = Array(repeating: false, count:numberOfPeopleToParticipate)
    var boolRandom = false
    
    for humanIndex in 0..<numberOfPeopleToParticipate {
        boolRandom = boolRandomGenerate(prevBool: boolRandom)
        ladderBoolRow[humanIndex] = boolRandom
    }
    
    return ladderBoolRow
}

///사다리를 만들지 여부를 랜덤으로 결정하는 함수
func boolRandomGenerate(prevBool: Bool) -> Bool {
    var boolRandom = Bool.random()
    if prevBool == true && boolRandom == true {
        boolRandom = false
    }
    
    return boolRandom
}

/// 사다리를 출력하는 함수
func printLadder (_ ladderBoolBoard:[[Bool]]) -> () {
    let maximumLadderHeight = ladderBoolBoard.count
    
    for heightIndex in 0..<maximumLadderHeight {
        printLadderRow(ladderBoolRow: ladderBoolBoard[heightIndex])
    }
}

/// 사다리 한줄을 출력하는 함수
func printLadderRow (ladderBoolRow:[Bool]) -> () {
    let numberOfPeopleToParticipate = ladderBoolRow.count
    for humanIndex in 0..<numberOfPeopleToParticipate {
        print("|", terminator: "")
        switch ladderBoolRow[humanIndex] {
        case true : print("-", terminator: "")
        case false : print(" ", terminator: "")
        }
    }
    print("|")
}

/// 사다리 게임 함수
func ladderGame() {
    var numberOfPeopleToParticipate = inputFromUser(variableName: "numberOfPeopleToParticipate")
    var maximumLadderHeight = inputFromUser(variableName: "maximumLadderHeight")
    
    while numberOfPeopleToParticipate < 1 || maximumLadderHeight < 1 {
        print("참여할 사람과 최대 사다리 높이를 정확히 입력해주세요.")
        numberOfPeopleToParticipate = inputFromUser(variableName: "numberOfPeopleToParticipate")
        maximumLadderHeight = inputFromUser(variableName: "maximumLadderHeight")
    }
    
    let ladderBoolBoard = makeLadder(numberOfPeopleToParticipate, maximumLadderHeight)
    printLadder(ladderBoolBoard)
}

ladderGame()

