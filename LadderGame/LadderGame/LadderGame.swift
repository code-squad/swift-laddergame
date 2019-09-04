//
//  LadderGame.swift
//  LadderGame
//
//  Created by jake.you on 2019/09/04.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    var players: [LadderPlayer]
    var height: Int
    
    var ladderSteps: [LadderStep] {
        var result = [LadderStep]()
        for players in self.players {
            result.append(LadderStep(step:players.name.count))
        }
        return result
    }
    
    init(players: [LadderPlayer], height: Int) {
        self.players = players
        self.height = height
    }
}
