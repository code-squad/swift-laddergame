//
//  main.swift
//  LadderGame
//
//  Created by Joon-ho Kil on 04/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

/// 입력할 수 있는 변수 이름들과 입력 안내 멘트
enum InputableVariableName: String {
    case numberOfParticipants = "참여할 사람은 몇 명 인가요?"
    case maximumLadderHeight = "최대 사다리 높이는 몇 개인가요?"
}

/// 에러 타입
enum LadderGameErrors: Error {
    case lessNumber
}

/// 사용자로부터 입력받는 함수
func input () -> (Int, Int) {
    var numberOfParticipants = 0
    var maximumLadderHeight = 0
    
    while true {
        do {
            numberOfParticipants = try inputFromUser(InputableVariableName.numberOfParticipants)
            maximumLadderHeight = try inputFromUser(InputableVariableName.maximumLadderHeight)
            break
        } catch {
            print("참여할 사람과 최대 사다리 높이는 최소 2 이상이어야 합니다.")
        }
    }
    
    return (numberOfParticipants, maximumLadderHeight)
}
func inputFromUser (_ variableName: InputableVariableName) throws -> (Int) {
    print(variableName.rawValue)
    guard let numberEnterd = Int(readLine() ?? "0"), numberEnterd > 1 else {
        throw LadderGameErrors.lessNumber
    }
    return numberEnterd
}

/// 사다리를 만들고 저장하는 함수
func makeLadder (_ numberOfParticipants: Int, _ maximumLadderHeight: Int) -> [[Bool]] {
    var ladderBoolBoard : [[Bool]] = Array(repeating: Array(repeating: false, count:numberOfParticipants-1), count: maximumLadderHeight)
    
    for heightIndex in 0..<maximumLadderHeight {
        ladderBoolBoard[heightIndex] = makeLadderRow(numberOfParticipants)
    }
    
    return ladderBoolBoard
}

/// 사다리 한줄을 만드는 함수
func makeLadderRow (_ numberOfParticipants: Int) -> [Bool] {
    var ladderBoolRow : [Bool] = Array(repeating: false, count:numberOfParticipants)
    var boolRandom = false
    
    for humanIndex in 0..<numberOfParticipants-1 {
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
    let numberOfParticipants = ladderBoolRow.count
    for humanIndex in 0..<numberOfParticipants-1 {
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
    let numberOfParticipants, maximumLadderHeight: Int
    (numberOfParticipants, maximumLadderHeight) = input()
    let ladderBoolBoard = makeLadder(numberOfParticipants, maximumLadderHeight)
    printLadder(ladderBoolBoard)
}

ladderGame()

