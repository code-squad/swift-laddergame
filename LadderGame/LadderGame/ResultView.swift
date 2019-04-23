//
//  ResultView.swift
//  LadderGame
//
//  Created by JieunKim on 21/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {
    
    enum LadderComponent: String {
        case connect = "-----"
        case blank = "     "
        case column = "|"
    }
    
    static private func printComponent(_ items: LadderComponent) {
        print(items.rawValue, terminator: "")
    }
    
    static private func printText(_ ladderGame: LadderGame) {
        for player in ladderGame.getPlayer() {
            let space = limitPlayer(name: player.name)
            print(player.name, terminator: space)
        }
    }
    
    static private func limitPlayer(name: String) -> String{
        return String(repeating: " ", count: 6 - name.count)
    }
    
    static private func connectLadder(step: LadderStep) {
        step.isConnceted ? printComponent(.connect) : printComponent(.blank)
        printComponent(.column)
    }
    
    static private func drawFloor(ladder: [LadderStep]) {
        printComponent(.column)
        for step in ladder {
            connectLadder(step: step)
        }
        print()
    }
    
    static func drawLadder(game: LadderGame) {
        for floor in game.ladder.getLayer() {
            drawFloor(ladder: floor.getSteps())
        }
        printText(game)
    }
}

