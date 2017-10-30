//
//  Result.swift
//  LadderGame
//
//  Created by yuaming on 2017. 10. 27..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct Result {
    var status: Bool
    var message: String
    var ladderGame: LadderGame?
    
    init(status: Bool, message: String, ladderGame: LadderGame?) {
        self.status = status
        self.message = message
        self.ladderGame = ladderGame
        
        printResult()
    }

    private func printResult() {
        guard status && ladderGame != nil else {
            return print("\(message)")
        }
        
        printLadders()
        printNames()
    }
    
    private func printLadders() {
        print("\(message)")
    }
    
    private func printNames() {
        for player in ladderGame!.names {
            print(player.name, terminator: "   ")
        }
        
        print("\n")
    }
}
