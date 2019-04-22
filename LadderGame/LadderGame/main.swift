//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

typealias Settings = (players: [LadderPlayer], ladderHeight: UInt)

/// 게임 시작에 필요한 유저 숫자와 사다리 높이를 설정합니다.
/// - throws:
///     - InputError.isEmpty: 문자열이 비어있음
///     - InputError.notANumber: 정수형 변환이 불가능
///     - InputError.invalidNumber: 유효하지 않은 정수 범위
/// - returns: 유저 숫자와 사다리 높이를 포함한 튜플
func setupGame() throws -> Settings {
    let inputView = InputView()
    let players = try inputView.readPlayers()
    let ladderHeight = try inputView.readHeight(possibleRange: 1..<10)
    
    return (players, UInt(ladderHeight))
}

/// 게임의 결과인 사다리를 출력합니다.
/// - parameter result: bool 타입 배열
func endGame(_ result: [LadderStep]) {
    let ladder = getLadder(result)

    print(ladder)
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
        let ladderGame = LadderGame(players: settings.players, height: settings.ladderHeight)
        let result = ladderGame.start()
        
    } catch InputError.isEmpty {
        print("입력이 정의되지 않았습니다.")
    } catch InputError.notANumber {
        print("정수형으로 변환되지 않는 입력입니다.")
    } catch InputError.invalidNumber {
        print("유효하지 않은 범위의 입력입니다.")
    }
}

try playGame()
