//
//  LadderGame.swift
//  LadderGame
//
//  Created by JieunKim on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    private(set) var Player : [LadderPlayer]
    private var Layer = 0
    
    init(Player: [LadderPlayer], Layer: Int) {
        self.Player = Player
        self.Layer = Layer
    }
    
    var numberOfPlayer: Int {
        get {
            return Player.count
        }
    }
    
    var ladder: Ladder {
        get {
            return Ladder(numberOfPlayer: numberOfPlayer, ladderLayer: Layer)
        }
    }
    
}

