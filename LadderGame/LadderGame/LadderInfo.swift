//
//  LadderInfo.swift
//  LadderGame
//
//  Created by 이동영 on 18/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderInfo{
    private let players : [LadderPlayer]
    private let height : Int
    lazy var width :Int =  self.players.count*2-1
    
    init(players:[LadderPlayer],height:Int) {
        self.players = players
        self.height = height
    }
    
}
