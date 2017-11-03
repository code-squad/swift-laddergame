//
//  LadderGame.swift
//  LadderGame
//
//  Created by Eunjin Kim on 2017. 10. 27..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//
import Foundation

struct LadderGame {
    private(set) var height = 0
    private(set) var names : [LadderPlayer] = []
    private(set) var randomValue: [[Int]] = [[]]
    
    init(ladderGameInfo: LadderGameInfo) {
        self.height = ladderGameInfo.heightForLadder
        self.names = ladderGameInfo.names
        randomValue = [[Int]](repeating: [Int](repeating: 0, count: names.count), count: height)
        makeRandomValue()
    }
    
    mutating func makeRandomValue(){
        for i in 0..<height {
            randomValue[i] = randomValue[i].map({$0+Int(arc4random_uniform(2))})
        }
    }
}
