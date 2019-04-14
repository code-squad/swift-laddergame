//
//  LadderStep.swift
//  LadderGame
//
//  Created by jang gukjin on 12/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

/// 사다리 발판 하나를 표현하는 구조체
struct LadderStep {
    func makeLayerOfLadder(players:[String])->[Int]{
        var layerOfLadders : [Int] = []
        for playerIndex in 0...players.count-2{
            var judgmentLadder = Int.random(in:0...1)
            if playerIndex >= 1 && layerOfLadders[playerIndex-1] == 1 { judgmentLadder = 0}
            layerOfLadders.append(judgmentLadder)
        }
        return layerOfLadders
    }
    
    func makeLadder(players: [String], ladderHeight:Int)->[[Int]]{
        var ladders : [[Int]] = []
        for ladderIndex in 0...ladderHeight-1{
            let layerOfLadders = makeLayerOfLadder(players: players)
            ladders.append(layerOfLadders)
        }
        return ladders
    }
}
