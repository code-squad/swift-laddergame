//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

struct GameController {
    
    static func executeLadderGame() {
        let ladderData: ([String], Int)
        do {
            ladderData = try InputView.getLadderDataForGame()
        } catch {
            print("Error: \(error)")
            return
        }
        let (namesOfPlayers, maxHeightOfLadder) = ladderData
        
        let ladderGame = LadderGame(height: maxHeightOfLadder, playerNames: namesOfPlayers)
        ResultView.printLadderGame(using: ladderGame)
    }
}

GameController.executeLadderGame()
