//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

typealias Setting = (userNumber: Int?, ladderHeight: Int?)

/// 사다리 부품 타입 정의
enum LadderPart: String {
    case rung = "|"
    case bar = "-"
    case none = " "
}

/// 게임을 시작합니다.
func gameStart(setting: Setting) {
    guard let userNumber = setting.userNumber,
        let ladderHeight = setting.ladderHeight else { return }
    let ladderMatrix = create2DMatrix(rows: userNumber, columns: ladderHeight)
}
/// 게임을 설정합니다.
func setupGame() -> Setting {
    let numberOfPlayers = setUserNumber()
    let ladderHeight = setLadderHeight()
    
    return (numberOfPlayers, ladderHeight)
}
/// 유저수를 설정합니다.
func setUserNumber() -> Int? {
    guard let input = readLine() else { return nil }
    return Int(input)
}
/// 사다리의 높이를 설정합니다.
func setLadderHeight() -> Int? {
    guard let input = readLine() else { return nil }
    return Int(input)
}
/// 2차원 배열을 생성합니다.
func create2DMatrix(rows: Int, columns: Int) -> [[LadderPart]] {
    return Array(repeating: Array(repeating: .none, count: rows * 2 - 1), count: columns)
}
