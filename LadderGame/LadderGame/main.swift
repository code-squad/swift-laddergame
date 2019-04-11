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
    switch variableName {
    case "humanNumber" : print("참여할 사람은 몇 명 인가요?")
    case "heightNumber" : print("최대 사다리 높이는 몇 개인가요?")
    default: print("어떤 값을 입력하실건가요?")
    }
    let optionalInput = readLine()
    let inputNumber = verifyInput(variableName, optionalInput)
    
    return inputNumber
}

/// 사용자로부터 입력받은 데이터를 검증하는 함수
func verifyInput (_ variableName: String, _ optionalInput: String?) ->  Int {
    var inputNumber = 0

    if let stringInput = optionalInput {
        inputNumber = Int(stringInput) ?? 0
    }
    if variableName == "humanNumber" {
        inputNumber -= 1
    }
    
    return inputNumber
}

/// 사다리를 만들고 저장하는 함수
func makeLadder (_ humanNumber:Int, _ heightNumber:Int) -> [[Bool]] {
    var ladderBoolBoard : [[Bool]] = Array(repeating: Array(repeating: false, count:humanNumber), count: heightNumber)
    var boolRandom = false
    
    for heightIndex in 0..<heightNumber {
        for humanIndex in 0..<humanNumber {
            boolRandom = boolRandomGenerate(prevBool: boolRandom)
            ladderBoolBoard[heightIndex][humanIndex] = boolRandom
        }
    }
    
    return ladderBoolBoard
}

///사다리를 만들지 여부를 랜덤으로 결정하는 함수
func boolRandomGenerate(prevBool: Bool) -> Bool {
    var boolRandom = Bool.random()
    if prevBool == true && boolRandom == true {
        boolRandom = false
    }
    
    return boolRandom
}

/// 사다리를 출력하는 프로그램
func printLadder (_ ladderBoolBoard:[[Bool]]) -> () {
    let heightNumber = ladderBoolBoard.count
    let humanNumber = ladderBoolBoard[0].count
    
    for heightIndex in 0..<heightNumber {
        for humanIndex in 0..<humanNumber {
            print("|", terminator: "")
            switch ladderBoolBoard[heightIndex][humanIndex] {
            case true : print("-", terminator: "")
            case false : print(" ", terminator: "")
            }
        }
        print("|")
    }
}

/// 사다리 게임 함수
func ladderGame() {
    var humanNumber = inputFromUser(variableName: "humanNumber")
    var heightNumber = inputFromUser(variableName: "heightNumber")
    
    while humanNumber < 1 || heightNumber < 1 {
        print("참여할 사람과 최대 사다리 높이를 정확히 입력해주세요.")
        humanNumber = inputFromUser(variableName: "humanNumber")
        heightNumber = inputFromUser(variableName: "heightNumber")
    }
    
    let ladderBoolBoard = makeLadder(humanNumber, heightNumber)
    printLadder(ladderBoolBoard)
}

ladderGame()

