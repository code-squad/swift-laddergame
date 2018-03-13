//
//  LadderGame.swift
//  LadderGame
//
//  Created by rhino Q on 2018. 3. 13..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

extension Int{
    var arc4random:Int{
        return Int(arc4random_uniform(UInt32(self)))
    }
}


struct LadderGame {
    private var numberOfPerson:Int
    private var heightOfLadder:Int
    private var ladderMatrix : [[String]]
    
    init(_ numberOfPerson:Int, _ heightOfLadder:Int) {
        self.numberOfPerson = numberOfPerson
        self.heightOfLadder = heightOfLadder
        self.ladderMatrix = Array(repeating: Array(repeating: " |", count: numberOfPerson-1), count: heightOfLadder)
    }
    
    mutating func makeLadder() -> [[String]]{
        let numberOfLadder = ( numberOfPerson + heightOfLadder ) / 2
        for _ in 0..<numberOfLadder{
            ladderMatrix[heightOfLadder.arc4random][(numberOfPerson-1).arc4random] = "-|"
        }
        return ladderMatrix
    }
}
