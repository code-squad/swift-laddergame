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

/// 게임 실행에 필요한 유저 숫자와 사다리 높이를 설정합니다.
/// - returns: 유저 숫자와 사다리 높이를 포함한 튜플
func setupGame() -> Settings {
    let userNumber = setUserNumber()
    let ladderHeight = setLadderHeight()
    
    return (userNumber, ladderHeight)
}

/// 게임을 시작합니다.
/// - parameter settings: 유저 숫자와 사다리 높이를 포함한 게임 실행에 필요한 설정
/// - returns: 사다리를 구성한 결과를 나타낸 2차원 배열
func startGame(_ settings: Settings) -> [[LadderPart]]? {
    guard let userNumber = settings.userNumber,
        let ladderHeight = settings.ladderHeight else { return nil }
    let ladderMatrix = create2DMatrix(rowCount: userNumber, colCount: ladderHeight)
    let ladder = buildLadder(ladderMatrix)
    
    return ladder
}

/// 게임의 결과인 사다리를 출력합니다.
/// - parameter settings: 사다리 부품으로 구성된 이차원 배열
func endGame(ladder: [[LadderPart]]) {
    printLadder(ladder)
}

/// 유저수를 설정합니다.
/// - returns: 둘 중 하나:
///     - 유저 숫자 정수형
///     - 입력을 정수형으로 형변환 실패시 Nil
func setUserNumber() -> Int? {
    print("참여할 사람은 몇 명 인가요?")
    guard let input = readLine() else { return nil }
    
    return Int(input)
}

/// 사다리의 높이를 설정합니다.
/// - returns: 둘 중 하나:
///     - 사다리 높이 정수형
///     - 입력을 정수형으로 형변환 실패시 Nil
func setLadderHeight() -> Int? {
    print("최대 사다리 높이는 몇 개인가요?")
    guard let input = readLine() else { return nil }
    
    return Int(input)
}

/// 2차원 배열을 생성합니다.
/// - returns: 사다리 부품 타입의 기본 값을 가진 2차원 배열
func create2DMatrix(rowCount: Int, colCount: Int) -> [[LadderPart]] {
    return Array(repeating: Array(repeating: .none, count: rowCount * 2 - 1), count: colCount)
}

/// 사다리를 구성합니다.
/// - returns: 사다리 부품 타입을 가진 2차원 배열
func buildLadder(_ matrix: [[LadderPart]]) -> [[LadderPart]] {
    var ladderMatrix = matrix
    
    for (colNumber, array) in matrix.enumerated() {
        for rowNumber in 0 ..< array.count {
            ladderMatrix[colNumber][rowNumber] = getLadderPart(index: rowNumber)
        }
    }
    
    return ladderMatrix
}

/// 사다리 부품을 가져옵니다.
/// - returns: 사다리 부품 타입
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
/// - parameter matrix: 사다리 부품 타입을 가진 2차원 배열
func printLadder(_ matrix: [[LadderPart]]) {
    for array in matrix {
        for part in array {
            print(part.rawValue, terminator: "")
        }
        print(separator: "\n")
    }
}

/// 랜덤 불 값을 가져옵니다.
/// - returns: 무작위로 추출한 true 혹은 false
func randomBool() -> Bool {
    return Int(arc4random_uniform(2)) == 1
}

// 게임 실행
let settings = setupGame()
if let results = startGame(settings) {
    endGame(ladder: results)
}
