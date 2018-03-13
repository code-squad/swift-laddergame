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
    private var heightOfLadder:Int
    private var names:[LadderPlayer]
    
    init(_ names:[String], _ heightOfLadder:Int) {
        self.names = [LadderPlayer]()
        for name in names{
            self.names.append(LadderPlayer(name: name))
        }
        self.heightOfLadder = heightOfLadder
    }
    
    mutating func makeLadder() -> ([[Bool]], [LadderPlayer]){
        var ladderMatrix = Array(repeating: Array(repeating: false, count: names.count-1), count: heightOfLadder)
        let numberOfLadder = ( names.count + heightOfLadder ) / 2
        for _ in 0..<numberOfLadder{
            ladderMatrix[heightOfLadder.arc4random][(names.count-1).arc4random] = true
        }
        return (ladderMatrix, names)
    }
}
