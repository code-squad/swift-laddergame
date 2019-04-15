//
//  ResultView.swift
//  LadderGame
//
//  Created by Daheen Lee on 12/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {
    func printLadderGame(using ladderGame: LadderGame) {
        //1. print ladderGame.board
        printLadder(using: ladderGame.board)
        //2. print player names
        printPlayers(using: ladderGame.players)
        
    }
    
    // print whole ladder
    func printLadder(using board: [[LadderStep]]) {
        for row in board {
            printLadderBy(row)
        }
    }
    
    func printLadderBy(_ row: [LadderStep]) {
        print("  ", terminator: "")
        printRail()
        for step in row {
            printStep(if: step.exists)
            printRail()
        }
        print("")
    }
    
    func printRail() {
        let rail = "|"
        print(rail, terminator: "")
    }
    
    func printStep(if exist: Bool) {
        let step = exist ? "-----" : "     "
        print(step, terminator: "")
    }
    
    func printPlayers(using players: [LadderPlayer]) {
        for player in players {
            print(player.name, terminator: "  ")
        }
    }
}
