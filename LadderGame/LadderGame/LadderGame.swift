//
//  LadderGame.swift
//  LadderGame
//
//  Created by cocoa on 04/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    let players: [Player]
    let heightOfLadders: Int
    
    var ladders = [[Bool]]()
    
    init(players: [Player], heightOfLadders: Int) {
        self.players = players
        self.heightOfLadders = heightOfLadders
    }
    
    mutating func makeLadders() {
        for _ in 1...heightOfLadders {
            var line = [Bool]()
            for _ in 1...players.count {
                let random = Int.random(in: 0...1)
                line.append(random == 1)
            }
            ladders.append(line)
        }
    }
    
    func printLadders() {
        for line in ladders {
            print("|", terminator: "")
            for step in line {
                step ? print("-----", terminator: "") : print("     ", terminator: "")
                print("|", terminator: "")
            }
            print("")
        }
        players.forEach {
            print($0.name, terminator: " ")
        }
        print()
    }
}
