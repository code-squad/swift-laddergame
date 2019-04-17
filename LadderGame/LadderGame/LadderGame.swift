//
//  LadderGame.swift
//  LadderGame
//
//  Created by joon-ho kil on 4/12/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    private let height: Int
    let names : [LadderPlayer]
    private(set) var ladderBoard: [[Bool]]
    
    init(_ maximumHeight: Int, _ players: [LadderPlayer]) throws {
        if maximumHeight < 2 || players.count < 2 { throw LadderInputErrors.lessNumber }
        height = maximumHeight
        names = players
        ladderBoard = Array(repeating: Array(repeating: false, count:players.count-1), count: maximumHeight)
    }
    
    /// 사다리를 만들고 저장하는 함수
    mutating func makeLadder () {
        for heightIndex in 0..<height {
            ladderBoard[heightIndex] = makeLadderRow(names.count)
        }
    }
    
    /// 사다리 한줄을 만드는 함수
    private func makeLadderRow (_ players: Int) -> [Bool] {
        var ladderRow : [Bool] = Array(repeating: false, count:players)
        var random = false
        
        for playerIndex in 0..<players-1 {
            random = randomGenerate(prev: random)
            ladderRow[playerIndex] = random
        }
        
        return ladderRow
    }
    
    ///사다리를 만들지 여부를 랜덤으로 결정하는 함수
    private func randomGenerate(prev: Bool) -> Bool {
        var random = Bool.random()
        if prev == true && random == true {
            random = false
        }
        
        return random
    }
}
