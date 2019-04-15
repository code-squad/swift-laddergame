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
    func makeLayerOfLadder(players:[String])->[Bool]{
        var layerOfLadders : [Bool] = []
        for playerIndex in 0...players.count-2{
            var judgmentLadder = Bool.random()
            if playerIndex >= 1 && layerOfLadders[playerIndex-1] == true { judgmentLadder = false}
            layerOfLadders.append(judgmentLadder)
        }
        return layerOfLadders
    }
    
    func makeLadder(players: [String], ladderHeight:Int)->[[Bool]]{
        var ladders : [[Bool]] = []
        for ladderIndex in 0...ladderHeight-1{
            let layerOfLadders = makeLayerOfLadder(players: players)
            ladders.append(layerOfLadders)
        }
        return ladders
    }
}
