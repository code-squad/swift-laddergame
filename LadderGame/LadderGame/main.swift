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
    case participants = "참여할 사람은 몇 명 인가요?"
    case maximumHeight = "최대 사다리 높이는 몇 개인가요?"
}

/// 에러 타입
enum LadderGameErrors: Error {
    case lessNumber
}

/// 사용자로부터 입력받는 함수
func input () -> (Int, Int) {
    var participants = 0
    var maximumHeight = 0
    
    while true {
        do {
            participants = try inputFromUser(InputableVariableName.participants)
            maximumHeight = try inputFromUser(InputableVariableName.maximumHeight)
            break
        } catch {
            print("참여할 사람과 최대 사다리 높이는 최소 2 이상이어야 합니다.")
        }
    }
    
    return (participants, maximumHeight)
}
func inputFromUser (_ variableName: InputableVariableName) throws -> (Int) {
    print(variableName.rawValue)
    guard let numberEnterd = Int(readLine() ?? "0"), numberEnterd > 1 else {
        throw LadderGameErrors.lessNumber
    }
    return numberEnterd
}

/// 사다리를 만들고 저장하는 함수
func makeLadder (_ participants: Int, _ maximumHeight: Int) -> [[Bool]] {
    var ladderBoolBoard : [[Bool]] = Array(repeating: Array(repeating: false, count:participants-1), count: maximumHeight)
    
    for heightIndex in 0..<maximumHeight {
        ladderBoolBoard[heightIndex] = makeLadderRow(participants)
    }
    
    return ladderBoolBoard
}

/// 사다리 한줄을 만드는 함수
func makeLadderRow (_ participants: Int) -> [Bool] {
    var ladderBoolRow : [Bool] = Array(repeating: false, count:participants)
    var boolRandom = false
    
    for humanIndex in 0..<participants-1 {
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
    let maximumHeight = ladderBoolBoard.count
    
    for heightIndex in 0..<maximumHeight {
        printLadderRow(ladderBoolRow: ladderBoolBoard[heightIndex])
    }
}

/// 사다리 한줄을 출력하는 함수
func printLadderRow (ladderBoolRow:[Bool]) -> () {
    let participants = ladderBoolRow.count
    for humanIndex in 0..<participants-1 {
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
    let participants, maximumHeight: Int
    (participants, maximumHeight) = input()
    let ladderBoolBoard = makeLadder(participants, maximumHeight)
    printLadder(ladderBoolBoard)
}

ladderGame()

