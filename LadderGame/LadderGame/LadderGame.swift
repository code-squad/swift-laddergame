//
//  LadderGame.swift
//  LadderGame
//
//  Created by rhino Q on 2018. 3. 13..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

/*
 들여쓰기 depth를  1단계로 줄이기
 메소드의 라인 최대 10줄
 method가 한 가지일만 하도록
 */

import Foundation

extension Int{
    var arc4random:Int{
        return Int(arc4random_uniform(UInt32(self)))
    }
}


struct LadderGame {
    
    private var ladderGameResult:LadderGameResult
    private var heightOfLadder:Int
    private var numberOfLadder:Int = 0
    init(_ names:[String], _ heightOfLadder:Int) {
        ladderGameResult = LadderGameResult()
        for name in names{
            ladderGameResult.names.append(LadderPlayer(name: name))
        }
        self.heightOfLadder = heightOfLadder
    }
    
    mutating func makeLadder() -> LadderGameResult {
        ladderGameResult.ladderMatrix = Array(repeating: Array(repeating: false, count: ladderGameResult.names.count-1), count: heightOfLadder)
        
        numberOfLadder = ( ladderGameResult.names.count + heightOfLadder ) / 2
        
        for _ in 0..<numberOfLadder{
            ladderGameResult.ladderMatrix[heightOfLadder.arc4random][(ladderGameResult.names.count-1).arc4random] = true
        }
        return ladderGameResult
    }
}
