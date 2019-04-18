//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

typealias Settings = (userNumber: Int, ladderHeight: Int)

/// 사다리 부품 타입 정의
enum LadderPart: Character {
    case rung = "|"
    case bar = "-"
    case empty = " "
    
    init(_ isEmpty: Bool) {
        self = isEmpty ? .empty : .bar
    }
    
    /// 다음 사다리 부품의 상태를 가져옵니다.
    /// - parameter isEmpty: true 혹은 flase
    /// - returns: true 혹은 false
    static func getStatus(_ isEmpty: Bool) -> Bool {
        return isEmpty ? Bool.random() : true
    }
}

/// 게임 시작에 필요한 유저 숫자와 사다리 높이를 설정합니다.
/// - throws:
///     - InputError.isEmpty: 문자열이 비어있음
///     - InputError.notANumber: 정수형 변환이 불가능
///     - InputError.invalidNumber: 유효하지 않은 정수 범위
/// - returns: 유저 숫자와 사다리 높이를 포함한 튜플
func setupGame() throws -> Settings {
    let userNumber = try setUserNumber()
    let ladderHeight = try setLadderHeight()
    
    return (userNumber, ladderHeight)
}

/// 게임을 시작합니다.
/// - parameter settings: 유저 숫자와 사다리 높이를 포함한 게임 실행에 필요한 설정
/// - returns: bool 타입 배열을 갖는 2차원 배열
func startGame(_ settings: Settings) -> [[Bool]]  {
    let result = createLadder(width: settings.userNumber, height: settings.ladderHeight)
    
    return result
}

/// 게임의 결과인 사다리를 출력합니다.
/// - parameter result: bool 타입 배열
func endGame(_ result: [[Bool]]) {
    let ladder = getLadder(result)

    print(ladder)
}

/// 입력 값을 검증합니다.
/// - parameter from: 옵셔널을 갖는 문자열
/// - throws:
///     - InputError.isEmpty: 문자열이 비어있음
///     - InputError.notANumber: 정수형 변환이 불가능
///     - InputError.invalidNumber: 유효하지 않은 정수 범위
/// - returns: 문자열을 정수 형변환한 값
func validateInput(_ from: String?) throws -> Int {
    guard let input = from, !input.isEmpty else {
        throw InputError.isEmpty
    }
    
    guard let number = Int(input) else {
        throw InputError.notANumber
    }
    
    guard number > 1 && number <= Int.max else {
        throw InputError.invalidNumber
    }
    
    return number
}

/// 유저수를 설정합니다.
/// - throws:
///     - InputError.isEmpty: 문자열이 비어있음
///     - InputError.notANumber: 정수형 변환이 불가능
///     - InputError.invalidNumber: 유효하지 않은 정수 범위
/// - returns: 유저 숫자 정수형
func setUserNumber() throws -> Int {
    print("참여할 사람은 몇 명 인가요?")
    let userNumber = try validateInput(readLine())
    
    return userNumber
}

/// 사다리의 높이를 설정합니다.
/// - throws:
///     - InputError.isEmpty: 문자열이 비어있음
///     - InputError.notANumber: 정수형 변환이 불가능
///     - InputError.invalidNumber: 유효하지 않은 정수 범위
/// - returns: 사다리 높이 정수형
func setLadderHeight() throws -> Int {
    print("최대 사다리 높이는 몇 개인가요?")
    let ladderHeight = try validateInput(readLine())
    
    return ladderHeight
}

/// 사다리를 구성합니다.
/// - parameters:
///     - width: 사다리의 가로 길이 정수형
///     - height: 사다리의 세로 길이 정수형
/// - returns: bool 타입 배열을 갖는 2차원 배열
func createLadder(width: Int, height: Int) -> [[Bool]] {
    return Array(0..<height).map { _ in createLadderLayer(width - 1) }
}

/// 사다리 층을 생성합니다.
/// - parameter length: 사다리의 길이인 정수
/// - returns: bool 타입을 갖는 배열
func createLadderLayer(_ length: Int) -> [Bool] {
    var parts: [Bool] = []
    var isLadderPartEmpty = true
    
    for _ in 0..<length {
        isLadderPartEmpty = LadderPart.getStatus(isLadderPartEmpty)
        parts.append(isLadderPartEmpty)
    }
    
    return parts
}

/// 사다리를 출력합니다.
/// - parameter layers: bool 타입 배열을 갖는 2차원 배열
func getLadder(_ layers: [[Bool]]) -> String {
    let ladder = layers.map { getLayer($0) }.joined(separator: "\n")
    
    return ladder
}

/// 사다리 층을 나타내는 문자열을 가져옵니다.
/// - parameter parts: bool 타입 배열
/// - returns: 사다리 층을 나타내는 문자열
func getLayer(_ parts: [Bool]) -> String {
    let rung = LadderPart.rung.rawValue.description
    let joined = parts.map { LadderPart($0).rawValue.description }.joined(separator: rung)
    let layer = "\(rung)\(joined)\(rung)"
    
    return layer
}

/// 게임을 실행 합니다.
/// - throws:
///     - InputError.isEmpty: 문자열이 비어있음
///     - InputError.notANumber: 정수형 변환이 불가능
///     - InputError.invalidNumber: 유효하지 않은 정수 범위
func playGame() throws {
    let settings = try setupGame()
    let result = startGame(settings)
    
    endGame(result)
}

do {
    try playGame()
} catch InputError.isEmpty {
    print("입력이 정의되지 않았습니다.")
} catch InputError.notANumber {
    print("정수형으로 변환되지 않는 입력입니다.")
} catch InputError.invalidNumber {
    print("유효하지 않은 범위의 입력입니다.")
}
