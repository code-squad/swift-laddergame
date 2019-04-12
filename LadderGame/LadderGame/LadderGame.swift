//
//  LadderGame.swift
//  LadderGame
//
//  Created by joon-ho kil on 4/12/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    var height = 0
    var names : [LadderPlayer]
    
    /// 사다리를 만들고 저장하는 함수
    func makeLadder (_ participants: Int, _ maximumHeight: Int) -> [[Bool]] {
        var ladderBoolBoard : [[Bool]] = Array(repeating: Array(repeating: false, count:participants-1), count: maximumHeight)
        
        for heightIndex in 0..<maximumHeight {
            ladderBoolBoard[heightIndex] = makeLadderRow(participants)
        }
        
        return ladderBoolBoard
    }
    
    /// 사다리 한줄을 만드는 함수
    func makeLadderRow (_ participants: Int) -> [Bool] {
        var ladderBoolRow : [Bool] = Array(repeating: false, count:participants)
        var boolRandom = false
        
        for humanIndex in 0..<participants-1 {
            boolRandom = boolRandomGenerate(prevBool: boolRandom)
            ladderBoolRow[humanIndex] = boolRandom
        }
        
        return ladderBoolRow
    }
    
    ///사다리를 만들지 여부를 랜덤으로 결정하는 함수
    func boolRandomGenerate(prevBool: Bool) -> Bool {
        var boolRandom = Bool.random()
        if prevBool == true && boolRandom == true {
            boolRandom = false
        }
        
        return boolRandom
    }
}
