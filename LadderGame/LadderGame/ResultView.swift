//
//  ResultView.swift
//  LadderGame
//
//  Created by Daheen Lee on 12/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {
    static func printLadderGame(using ladder: Ladder, for players: [LadderPlayer]) {
        //1. print ladderGame.board
        printLadder(using: ladder)
        //2. print player names
        printPlayers(using: players)
        
    }
    
    // print whole ladder
    static private func printLadder(using ladder: Ladder) {
        for row in ladder {
            printLadderBy(row)
        }
    }
    
    static private func printLadderBy(_ row: [LadderStep]) {
        print("  ", terminator: "")
        printRail()
        for step in row {
            printStep(if: step.exists)
            printRail()
        }
        print("")
    }
    
    static private func printRail() {
        let rail = "|"
        print(rail, terminator: "")
    }
    
    static private func printStep(if exist: Bool) {
        let step = exist ? "-----" : "     "
        print(step, terminator: "")
    }
    
    static private func printPlayers(using players: [LadderPlayer]) {
        for player in players {
            let centeredName = getCenteredName(originalName: player.name)
            print(centeredName, terminator: " ")
        }
        print("")
    }
    
    static public func getCenteredName(originalName: String) -> String {
        var centeredName = originalName
        
        if originalName.count < 5 {
            centeredName = String(repeating: " ", count: 5)
            let offsetFromStartIndex: Int = (5 - originalName.count)/2
            let insertingIndex = centeredName.index(centeredName.startIndex, offsetBy: offsetFromStartIndex)
            centeredName.insert(contentsOf: originalName, at: insertingIndex)
        }
        
        return String(centeredName.prefix(5))
    }
}
