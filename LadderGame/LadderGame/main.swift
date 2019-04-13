//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

typealias Settings = (userNumber: Int?, ladderHeight: Int?)

/// 사다리 부품 타입 정의
enum LadderPart: String {
    case rung = "|"
    case bar = "-"
    case none = " "
}

/// 게임을 시작합니다.
func startGame(_ settings: Settings) {
    guard let userNumber = settings.userNumber,
        let ladderHeight = settings.ladderHeight else { return }
    var ladderMatrix = create2DMatrix(rowCount: userNumber, colCount: ladderHeight)
    
    buildLadder(&ladderMatrix)
    printLadder(ladderMatrix)
}

/// 게임을 설정합니다.
func setupGame() -> Settings {
    let userNumber = setUserNumber()
    let ladderHeight = setLadderHeight()
    
    return (userNumber, ladderHeight)
}

/// 유저수를 설정합니다.
func setUserNumber() -> Int? {
    print("참여할 사람은 몇 명 인가요?")
    guard let input = readLine() else { return nil }
    return Int(input)
}

/// 사다리의 높이를 설정합니다.
func setLadderHeight() -> Int? {
    print("최대 사다리 높이는 몇 개인가요?")
    guard let input = readLine() else { return nil }
    return Int(input)
}

/// 2차원 배열을 생성합니다.
func create2DMatrix(rowCount: Int, colCount: Int) -> [[LadderPart]] {
    return Array(repeating: Array(repeating: .none, count: rowCount * 2 - 1), count: colCount)
}

/// 사다리를 구성합니다.
func buildLadder(_ matrix: inout [[LadderPart]]) {
    for (colNumber, array) in matrix.enumerated() {
        for rowNumber in 0 ..< array.count {
            matrix[colNumber][rowNumber] = getLadderPart(index: rowNumber)
        }
    }
}

/// 사다리 부품을 가져옵니다.
func getLadderPart(index: Int) -> LadderPart {
    // 짝수는 기둥, 홀수는 랜덤 값에 의해 가로 기둥을 가져옵니다.
    if index % 2 == 0 {
        return .rung
    } else {
        let isLadderPartEmpty = randomBool()
        return isLadderPartEmpty ? .none : .bar
    }
}

/// 사다리를 출력합니다.
func printLadder(_ matrix: [[LadderPart]]) {
    for array in matrix {
        for part in array {
            print(part.rawValue, terminator: "")
        }
        print(separator: "\n")
    }
}

/// 랜덤 불 값을 가져옵니다.
func randomBool() -> Bool {
    return Int(arc4random_uniform(2)) == 1
}

// 게임 실행
let settings = setupGame()
startGame(settings)
