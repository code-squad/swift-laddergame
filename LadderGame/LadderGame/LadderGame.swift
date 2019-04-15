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
    private let names : [LadderPlayer]
    var ladderBoolBoard: [[Bool]]
    
    /// 사다리를 만들고 저장하는 함수
    mutating func makeLadder () {
        for heightIndex in 0..<height {
            ladderBoolBoard[heightIndex] = makeLadderRow(names.count)
        }
    }
    
    /// 사다리 한줄을 만드는 함수
    private func makeLadderRow (_ players: Int) -> [Bool] {
        var ladderBoolRow : [Bool] = Array(repeating: false, count:players)
        var boolRandom = false
        
        for playerIndex in 0..<players-1 {
            boolRandom = boolRandomGenerate(prevBool: boolRandom)
            ladderBoolRow[playerIndex] = boolRandom
        }
        
        return ladderBoolRow
    }
    
    ///사다리를 만들지 여부를 랜덤으로 결정하는 함수
    private func boolRandomGenerate(prevBool: Bool) -> Bool {
        var boolRandom = Bool.random()
        if prevBool == true && boolRandom == true {
            boolRandom = false
        }
        
        return boolRandom
    }
    
    init(_ maximumHeight: Int, _ players: [LadderPlayer]) {
        height = maximumHeight
        names = players
        ladderBoolBoard = Array(repeating: Array(repeating: false, count:players.count-1), count: maximumHeight)
    }
}
