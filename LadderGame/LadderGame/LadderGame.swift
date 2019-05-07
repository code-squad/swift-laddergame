//
//  LadderGame.swift
//  LadderGame
//
//  Created by BLU on 2019. 4. 19..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    private(set) var players: [LadderPlayer]
    private let height: UInt
    
    /// 게임을 생성합니다.
    ///
    /// - Parameters:
    ///   - names: 참여할 유저 문자열 배열
    ///   - height: 사다리 높이 unsigned int
    init(names: [String], height: UInt) {
        self.players = names.compactMap { LadderPlayer(name: String($0)) }
        self.height = height
    }
    
    /// 게임을 실행하고 결과를 가져옵니다.
    ///
    /// - Returns: false 혹은 true를 갖는 array
    func start() -> [[Bool]] {
        return makeLadder()
    }
    
    /// 사다리를 구성합니다.
    ///
    /// - Returns: bool 타입 배열을 갖는 2차원 배열
    private func makeLadder() -> [[Bool]] {
        return Array(0..<self.height).map { _ in makeLadderLayer() }
    }
    
    /// 사다리 층을 생성합니다.
    ///
    /// - Returns: bool 타입 배열
    private func makeLadderLayer() -> [Bool] {
        let length = players.count - 1
        var steps: [Bool] = []
        var isLadderPartEmpty = true
        
        for _ in 0..<length {
            isLadderPartEmpty = nextStatus(from: isLadderPartEmpty)
            steps.append(isLadderPartEmpty)
        }

        return steps
    }
    
    /// 사다리 계단의 다음 상태를 가져옵니다.
    ///
    /// - Parameter isLadderPartEmpty: true 혹은 false
    /// - Returns: true 혹은 false
    private func nextStatus(from isLadderPartEmpty: Bool) -> Bool {
        return isLadderPartEmpty ? Bool.random() : true
    }
}
