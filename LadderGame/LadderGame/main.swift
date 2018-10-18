//
//  main.swift
//  ladderCony
//
//  Created by Elena on 18/10/2018.
//  Copyright © 2018 elena. All rights reserved.
//

import Foundation
struct Main {
    static func ladderGameStart() {
        let ladderGamePlay = InputView.readPlayerNames()
        let ladderGameLadder = InputView.getUserLadder()
        
        if let game = LadderGame(height: ladderGameLadder, players: ladderGamePlay!) {
            let ladderTwoLines: [[Int]] = game.createLadderStage()
            let result = ResultView(ladderTwoLine: ladderTwoLines)
            _ = result.printLadder(ladderTwoLines)
            _ = result.printPlayers(ladderGamePlay!)
        }
    }
}

Main.ladderGameStart()

