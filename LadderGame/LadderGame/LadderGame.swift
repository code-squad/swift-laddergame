//
//  LadderGame.swift
//  LadderGame
//
//  Created by JieunKim on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    private var players = [LadderPlayer]()
    private var height = 0
    private var _ladder: Ladder
    public func getPlayer()-> [LadderPlayer] {
        return players
    }
    
    init(players: [LadderPlayer], height: Int) {
        self.players = players
        self.height = height
        self._ladder = Ladder(numberOfPlayer: players.count, ladderLayer: height)
    }
    
    var numberOfPlayer: Int {
        get {
            return players.count
        }
    }
    
    var ladder: Ladder {
        get {
            return _ladder
        }
    }
}

