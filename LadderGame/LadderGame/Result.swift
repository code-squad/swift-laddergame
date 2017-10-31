//
//  Result.swift
//  LadderGame
//
//  Created by yuaming on 2017. 10. 27..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct Result {
    
    static func printResult(ladder _ladder: Ladder?, ladderGame _ladderGame: LadderGame?) -> Bool {
        if _ladder == nil && _ladderGame == nil {
            return false
        }

        printLadders(_ladder!)
        printNames(_ladderGame!)
        
        return true
    }
    
    private static func printLadders(_ ladder: Ladder) {
        print("\(ladder.ladder)")
    }
    
    private static func printNames(_ ladderGame: LadderGame) {
        for player in ladderGame.playerNames {
            print(player.name, terminator: "   ")
        }
        
        print("\n")
    }
}
