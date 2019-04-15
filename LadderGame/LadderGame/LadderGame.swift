//
//  LadderGame.swift
//  LadderGame
//
//  Created by Daheen Lee on 12/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    var height: Int
    var players: [LadderPlayer]
    var board: [LadderStep]
    
    init(height: Int, playerNames: [String]) {
        self.height = height
        self.players = playerNames.map{ (name) in LadderPlayer(of: name) }
        self.board = Array(repeating: LadderStep(exists: true), count: playerNames.count)
    }
    
    func buildBoard() {
        
    }
}
