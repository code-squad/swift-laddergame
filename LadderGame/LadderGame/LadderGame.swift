//
//  LadderGame.swift
//  LadderGame
//
//  Created by BLU on 2019. 4. 19..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    let players: [LadderPlayer]
    let height: UInt
    
    /// 게임을 실행하고 결과를 가져옵니다.
    ///
    /// - Returns: LadderStep을 갖는 array
    func start() -> [LadderStep] {
        let playerNumber = UInt(players.count)
        return createLadder(playerNumber)
    }
    
    /// 사다리를 구성합니다.
    ///
    /// - Parameter playerNumber: 유저 숫자 unsigned int
    /// - Returns: LadderStep을 갖는 array
    private func createLadder(_ playerNumber: UInt) -> [LadderStep] {
        return Array(0..<self.height).map { _ in LadderStep(length: playerNumber) }
    }
}
