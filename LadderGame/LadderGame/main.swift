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
/// - returns: bool 타입 배열을 갖는 2차원 배열
func startGame(_ settings: Settings) -> [[Bool]]? {
    guard let userNumber = settings.userNumber,
        let ladderHeight = settings.ladderHeight else { return nil }
    let ladder = buildLadder(width: userNumber, height: ladderHeight)
    
    return ladder
}

/// 게임의 결과인 사다리를 출력합니다.
/// - parameter settings: bool 타입 배열
func endGame(ladder: [[Bool]]) {
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

/// 사다리를 구성합니다.
/// - returns: bool 타입 배열을 갖는 2차원 배열
func buildLadder(width: Int, height: Int) -> [[Bool]] {
    var ladder: [[Bool]] = []
    
    for _ in 0 ..< height {
        ladder.append(getLadderLayer(width - 1))
    }
    
    return ladder
}

/// 사다리 층을 가져옵니다.
/// - parameter width: 사다리의 가로 길이인 정수
/// - returns: bool 타입을 갖는 배열
func getLadderLayer(_ length: Int) -> [Bool] {
    var layer: [Bool] = []
    
    for _ in 0 ..< length {
        layer.append(Bool.random())
    }
    
    return layer
}

/// 사다리 부품을 가져옵니다.
/// - returns: 사다리 부품 타입
func getLadderPart(index: Int) -> LadderPart {
    // 짝수는 기둥, 홀수는 랜덤 값에 의해 가로 기둥을 가져옵니다.
    if index % 2 == 0 {
        return .rung
    } else {
        let isLadderPartEmpty = Bool.random()
        return isLadderPartEmpty ? .none : .bar
    }
}

/// 사다리를 출력합니다.
/// - parameter matrix: bool 타입 배열을 갖는 2차원 배열
func printLadder(_ matrix: [[Bool]]) {
    for array in matrix {
        for part in array {
            print(part, terminator: "")
        }
        print(separator: "\n")
    }
}

// 게임 실행
let settings = setupGame()
if let results = startGame(settings) {
    endGame(ladder: results)
}
