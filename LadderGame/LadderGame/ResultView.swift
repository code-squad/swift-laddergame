//
//  ResultView.swift
//  LadderGame
//
//  Created by CHOMINJI on 15/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {
    var ladderGame: LadderGame
    
    var ladder: Ladder {
        get {
            return ladderGame.ladder
        }
    }
    
    private var players: [LadderPlayer] {
        get {
            return ladderGame.names
        }
    }
    
    func printNames() {
        for player in players.indices {
            let space = calculateSpaceFor(name: players[player].name)
            print(players[player].name, terminator: space)
        }
    }
    
    private func calculateSpaceFor(name: String) -> String{
        switch name.count {
        case 1:
            return "     "
        case 2:
            return "    "
        case 3:
            return "   "
        case 4:
            return "  "
        case 5:
            return " "
        default:
            return ""
        }
    }
}

