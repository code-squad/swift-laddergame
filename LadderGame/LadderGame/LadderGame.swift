//
//  LadderGame.swift
//  LadderGame
//
//  Created by jang gukjin on 12/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

/// 사다리의 높이 속성과 참여자를 Array로 표현
struct LadderGame {
    var names : [LadderPlayer]
    var height : Int
    
    init(players : [LadderPlayer], ladderHeight : Int){
        names = players
        height = ladderHeight
    }
    
    func makeLadder(ladderInfo : LadderGame)->[[Bool]]{
        var ladders : [[Bool]] = []
        for ladderIndex in 0...ladderInfo.height-1{
            let layerOfLadders = LadderStep().makeLayerOfLadder(players: ladderInfo.names)
            ladders.append(layerOfLadders)
        }
        return ladders
    }
}


