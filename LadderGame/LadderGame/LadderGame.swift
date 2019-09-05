//
//  LadderGame.swift
//  LadderGame
//
//  Created by MJ.KONG-MAC on 2019/09/04.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    private var heightOfLadders: Int
    private var ladders: Array<Array<Bool>> = []
    
    var playerNames: [LadderPlayer]
    var ladderStairs: [LadderStair]
    
    init(players: [LadderPlayer], ladders: Int) {
        playerNames = players
        heightOfLadders = ladders
        ladderStairs = []
    }
    
    mutating func makeLadders() {
        for _ in 1...heightOfLadders {
            var line : Array<Bool> = []
            for _ in 1..<playerNames.count {
                let random = Int.random(in: 0...1)
                line.append(random == 1)
            }
            ladders.append(line)
        }
        configureLadderStairs()
    }
    
    private mutating func configureLadderStairs() {
        var stair: String = ""
        for line in ladders {
            stair = "|"
            for step in line {
                if step {
                    stair = stair + "------"
                }
                else {
                    stair = stair + "      "
                }
                stair = stair + "|"
            }
            ladderStairs.append(LadderStair(stair: stair))
        }
    }
}
