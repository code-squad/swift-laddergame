//
//  LadderGame.swift
//  LadderGame
//
//  Created by BLU on 2019. 4. 19..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    private let players: [LadderPlayer]
    private let height: UInt
    
    /// 게임을 생성합니다.
    ///
    /// - Parameters:
    ///   - players: 게임 플레이어 구조체 배열
    ///   - height: 사다리 높이 unsigned int
    init(players: [LadderPlayer], height: UInt) {
        self.players = players
        self.height = height
    }
    
    /// 게임을 실행하고 결과를 가져옵니다.
    ///
    /// - Returns: false 혹은 true를 갖는 array
    func start() -> [[Bool]] {
        let playerNumber = UInt(players.count)
        return createLadder(playerNumber)
    }
    
    /// 사다리를 구성합니다.
    /// - parameters:
    ///     - width: 사다리의 가로 길이 정수형
    ///     - height: 사다리의 세로 길이 정수형
    /// - returns: bool 타입 배열을 갖는 2차원 배열
    func createLadder(_ playerNumber: UInt) -> [[Bool]] {
        return Array(0..<self.height).map { _ in createLadderLayer(playerNumber - 1) }
    }
    
    /// 사다리 층을 생성합니다.
    /// - parameter length: 사다리의 길이인 정수
    /// - returns: bool 타입을 갖는 배열
    func createLadderLayer(_ length: UInt) -> [Bool] {
        var parts: [Bool] = []
        var isLadderPartEmpty = true
        
        for _ in 0..<length {
            isLadderPartEmpty = LadderPart.getStatus(isLadderPartEmpty)
            parts.append(isLadderPartEmpty)
        }
        
        return parts
    }
}
