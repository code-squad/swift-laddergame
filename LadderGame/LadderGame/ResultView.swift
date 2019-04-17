//
//  ResultView.swift
//  LadderGame
//
//  Created by CHOMINJI on 15/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {
    private var ladderGame: LadderGame
    private var numberOfStep: Int
    
    init(game: LadderGame, numberOfStep: Int) {
        self.ladderGame = game
        self.numberOfStep = numberOfStep
    }

    func printNames() {
        for player in ladderGame.names {
            let space = calculateSpaceFor(name: player.name)
            print(player.name, terminator: space)
        }
    }
    
    private func calculateSpaceFor(name: String) -> String{
        return String(repeating: " ", count: 6 - name.count)
    }
    
    
    func drawStep(step: LadderStep) {
        
        step.hasStep ? print(LadderComponent.existStep.rawValue, terminator: LadderComponent.pole.rawValue) : print(LadderComponent.emptyStep.rawValue, terminator: LadderComponent.pole.rawValue)
    }

    func drawFloor(floor: [LadderStep]) {
        print(LadderComponent.pole.rawValue, terminator: "")
        for step in floor {
            drawStep(step: step)
        }
        print("")
    }

    func drawLadder() {
        for floor in ladderGame.ladder.floors {
            drawFloor(floor: floor.steps)
        }
    }
    
    enum LadderComponent: String {
        case existStep = "-----"
        case emptyStep = "     "
        case pole = "|"
    }

}

