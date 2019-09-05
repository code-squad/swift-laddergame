//
//  ResultView.swift
//  LadderGame
//
//  Created by MJ.KONG-MAC on 2019/09/04.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {
    
    private var ladderStairs: [LadderStair] = []
    private var players: [LadderPlayer] = []
    
    init(ladderStairs: [LadderStair], players: [LadderPlayer]) {
        self.ladderStairs = ladderStairs
        self.players = players
    }
    
    func printOutput() {
        ladderStairs.forEach { stair in
            print("\(stair.stair)")
        }
        printPlayers()
    }
    
    private func printPlayers() {
        players.forEach { playerName in
            print("\(playerName.name) ", terminator: "")
        }
        print("")
    }
}
