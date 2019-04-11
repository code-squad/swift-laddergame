//
//  main.swift
//  LadderGame
//
//  Created by Joon-ho Kil on 04/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

/// 사용자로부터 입력받는 참여할 사람 숫자를 함수
func inputFromUserToHumanNumber () -> (Int) {
    print("참여할 사람은 몇 명 인가요?")
    let optionalHumanNumber = readLine()
    let humanNumber = verifyHumanNumber(optionalHumanNumber)
    
    return humanNumber
}

/// 사용자로부터 최대 사다리 높이를 입력받는 함수
func inputFromUserToHightNumber () -> (Int) {
    print("최대 사다리 높이는 몇 개인가요?")
    let optionalHeightNumber = readLine()
    let heightNumber = verifyHeightNumber(optionalHeightNumber)
    
    return heightNumber
}

/// 사용자로부터 입력받은 참여할 사람 숫자를 검증하는 함수
func verifyHumanNumber (_ optionalHumanNumber: String?) ->  Int {
    var humanNumber = 0

    if let stringHumanNumber = optionalHumanNumber {
        humanNumber = Int(stringHumanNumber) ?? 0
        humanNumber -= 1
    }
    
    return humanNumber
}

/// 사용자로부터 입력받은 최대 사다리 높이를 검증하는 함수
func verifyHeightNumber (_ optionalHeightNumber: String?) ->  Int {
    var heightNumber = 0
    
    if let stringHeightNumber = optionalHeightNumber {
        heightNumber = Int(stringHeightNumber) ?? 0
    }
    
    return heightNumber
}


/// 사다리를 만들고 저장하는 함수
func makeLadder (_ humanNumber:Int, _ heightNumber:Int) -> [[Bool]] {
    var ladder : [[Bool]] = Array(repeating: Array(repeating: false,count:humanNumber ), count: heightNumber)
    var booleanRandom = false
    
    for heightIndex in 0..<heightNumber {
        for humanIndex in 0..<humanNumber {
            booleanRandom = booleanRandomGenerate(prev_bool: booleanRandom)
            ladder[heightIndex][humanIndex] = booleanRandom
        }
    }
    
    return ladder
}

///사다리를 만들지 여부를 랜덤으로 결정하는 함수
func booleanRandomGenerate(prev_bool: Bool) -> Bool {
    var booleanRandom = Bool.random()
    if prev_bool == true && booleanRandom == true {
        booleanRandom = false
    }
    
    return booleanRandom
}

/// 사다리를 출력하는 프로그램
func printLadder (_ ladder:[[Bool]]) -> () {
    let heightNumber = ladder.count
    let humanNumber = ladder[0].count
    
    for heightIndex in 0..<heightNumber {
        for humanIndex in 0..<humanNumber {
            print("|", terminator: "")
            switch ladder[heightIndex][humanIndex] {
            case true : print("-", terminator: "")
            case false : print(" ", terminator: "")
            }
        }
        print("|")
    }
}

/// 사다리 게임 함수
func ladderGame() {
    var humanNumber = inputFromUserToHumanNumber()
    var heightNumber = inputFromUserToHightNumber()
    
    while humanNumber < 1 || heightNumber < 1 {
        print("참여할 사람과 최대 사다리 높이를 정확히 입력해주세요.")
        humanNumber = inputFromUserToHumanNumber()
        heightNumber = inputFromUserToHightNumber()
    }
    
    let ladder = makeLadder(humanNumber, heightNumber)
    printLadder(ladder)
}

ladderGame()

