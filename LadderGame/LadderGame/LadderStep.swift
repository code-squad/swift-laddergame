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
    func makeLayerOfLadder(players:[LadderPlayer])->[Bool]{
        var layerOfLadders : [Bool] = []
        for playerIndex in 0...players.count-2{
            var judgmentLadder = Bool.random()
            judgmentLadder = distinctContinuousRowLadder(playerIndex: playerIndex, layerOfLadders: layerOfLadders, judgementLadder: judgmentLadder)
            layerOfLadders.append(judgmentLadder)
        }
        return layerOfLadders
    }
    
    func distinctContinuousRowLadder(playerIndex : Int, layerOfLadders : [Bool], judgementLadder : Bool)->Bool{
        if playerIndex >= 1 && layerOfLadders[playerIndex-1] == true { return false}
        else { return judgementLadder }
    }
}
