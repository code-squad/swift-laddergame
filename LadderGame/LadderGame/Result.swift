//
//  Result.swift
//  LadderGame
//
//  Created by yuaming on 2017. 10. 27..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct Result {
    
    static func printResult(_ resultGame: (ladder: Ladder?, ladderGame: LadderGame?)) -> Bool {
        guard let ladder = resultGame.ladder, let ladderGame = resultGame.ladderGame else {
            return false
        }

        printLadders(ladder)
        printNames(ladderGame)
        
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
