//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

typealias Settings = (userNumber: UInt, ladderHeight: UInt)

/// 게임 시작에 필요한 유저 숫자와 사다리 높이를 설정합니다.
/// - throws:
///     - InputError.isEmpty: 문자열이 비어있음
///     - InputError.notANumber: 정수형 변환이 불가능
///     - InputError.invalidNumber: 유효하지 않은 정수 범위
/// - returns: 유저 숫자와 사다리 높이를 포함한 튜플
func setupGame() throws -> Settings {
    let userNumber = try setPlayers()
    let ladderHeight = try setLadderHeight()
    
    return (userNumber, ladderHeight)
}

/// 게임을 시작합니다.
/// - parameter settings: 유저 숫자와 사다리 높이를 포함한 게임 실행에 필요한 설정
/// - returns: bool 타입 배열을 갖는 2차원 배열
func startGame(_ settings: Settings) -> [LadderStep]  {
    let result = createLadder(width: settings.userNumber, height: settings.ladderHeight)
    
    return result
}

/// 게임의 결과인 사다리를 출력합니다.
/// - parameter result: bool 타입 배열
func endGame(_ result: [LadderStep]) {
    let ladder = getLadder(result)

    print(ladder)
}

/// 유저수를 설정합니다.
/// - throws:
///     - InputError.isEmpty: 문자열이 비어있음
///     - InputError.notANumber: 정수형 변환이 불가능
///     - InputError.invalidNumber: 유효하지 않은 정수 범위
/// - returns: 유저 숫자 정수형
func setPlayers() throws -> UInt {
    let inputView = InputView()
    print("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)")
    let names = try inputView.readText().split(separator: ",")
    let players = names.map { LadderPlayer(name: String($0)) }
    
    return UInt(players.count)
}

/// 사다리의 높이를 설정합니다.
/// - throws:
///     - InputError.isEmpty: 문자열이 비어있음
///     - InputError.notANumber: 정수형 변환이 불가능
///     - InputError.invalidNumber: 유효하지 않은 정수 범위
/// - returns: 사다리 높이 정수형
func setLadderHeight() throws -> UInt {
    let inputView = InputView()
    print("최대 사다리 높이는 몇 개인가요?")
    let ladderHeight = try inputView.readNumber()
    
    return ladderHeight
}

/// 사다리를 구성합니다.
/// - parameters:
///     - width: 사다리의 가로 길이 정수형
///     - height: 사다리의 세로 길이 정수형
/// - returns: bool 타입 배열을 갖는 2차원 배열
func createLadder(width: UInt, height: UInt) -> [LadderStep] {
    return Array(0..<height).map { _ in createLadderLayer(width - 1) }
}

/// 사다리 층을 생성합니다.
/// - parameter length: 사다리의 길이인 정수
/// - returns: bool 타입을 갖는 배열
func createLadderLayer(_ length: UInt) -> LadderStep {
    var parts: [Bool] = []
    var isLadderPartEmpty = true
    
    for _ in 0..<length {
        isLadderPartEmpty = LadderPart.getStatus(isLadderPartEmpty)
        parts.append(isLadderPartEmpty)
    }
    
    return LadderStep(parts: parts)
}

/// 사다리를 출력합니다.
/// - parameter layers: bool 타입 배열을 갖는 2차원 배열
func getLadder(_ layers: [LadderStep]) -> String {
    let ladder = layers.map { getLayer($0.parts) }.joined(separator: "\n")
    
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
    do {
        let settings = try setupGame()
        let result = startGame(settings)
        
        endGame(result)
    } catch InputError.isEmpty {
        print("입력이 정의되지 않았습니다.")
    } catch InputError.notANumber {
        print("정수형으로 변환되지 않는 입력입니다.")
    } catch InputError.invalidNumber {
        print("유효하지 않은 범위의 입력입니다.")
    }
}

try playGame()
