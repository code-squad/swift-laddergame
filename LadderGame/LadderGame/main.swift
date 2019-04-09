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
