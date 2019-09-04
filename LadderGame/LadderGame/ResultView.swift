//
//  ResultView.swift
//  LadderGame
//
//  Created by jake.you on 2019/09/04.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {
    let game:LadderGame
    func printout() {
        let ladderSteps = game.ladderSteps
        let players = game.players
        let height = game.height
        
        print("|", terminator:"")
        
        for _ in 0..<height {
            for ladderStep in ladderSteps {
                if Int.random(in: 0...1)  == 1 {
                    for _ in 0..<ladderStep.step {
                        print("-", terminator:"")
                    }
                }
                else {
                    print(" ", terminator:"")
                }
            }
            print("|", terminator:"")
        }
        for player in players {
            print("\(player.name) ", terminator:"")
        }
    }
}
