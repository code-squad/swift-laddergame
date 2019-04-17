//
//  ResultView.swift
//  LadderGame
//
//  Created by CHOMINJI on 15/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {
    
    static private func printNames(of ladderGame: LadderGame) {
        for player in ladderGame.names {
            let space = calculateSpaceFor(name: player.name)
            print(player.name, terminator: space)
        }
    }
    
    static private func calculateSpaceFor(name: String) -> String{
        return String(repeating: " ", count: 6 - name.count)
    }
    
    static private func drawStep(step: LadderStep) {
        step.hasStep ? print(LadderComponent.existStep.rawValue, terminator: LadderComponent.pole.rawValue) : print(LadderComponent.emptyStep.rawValue, terminator: LadderComponent.pole.rawValue)
    }

    static private func drawFloor(floor: [LadderStep]) {
        print(LadderComponent.pole.rawValue, terminator: "")
        for step in floor {
            drawStep(step: step)
        }
        print("")
    }

    static func drawLadder(game: LadderGame) {
        for floor in game.ladder.floors {
            drawFloor(floor: floor.steps)
        }
        printNames(of: game)
    }
    
    enum LadderComponent: String {
        case existStep = "-----"
        case emptyStep = "     "
        case pole = "|"
    }

}

