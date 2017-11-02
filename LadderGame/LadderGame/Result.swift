//
//  Result.swift
//  LadderGame
//
//  Created by yuaming on 2017. 10. 27..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct Result {
    
    static func printResult(_ _gameResult: LadderGameInformation?) -> Bool {
        guard let gameResult = _gameResult else {
            return false
        }

        printLadders(gameResult)
        printNames(gameResult)
        
        return true
    }
    
    private static func printLadders(_ infomation: LadderGameInformation) {
        print("\(infomation.result.ladder)")
    }
    
    private static func printNames(_ infomation: LadderGameInformation) {
        for player in infomation.result.playerNames {
            print(player.name, terminator: "   ")
        }
        
        print("\n")
    }
}
