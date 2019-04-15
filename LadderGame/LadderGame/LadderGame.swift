//
//  LadderGame.swift
//  LadderGame
//
//  Created by Daheen Lee on 12/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

typealias Ladder = [[LadderStep]]

struct LadderGame {
    var height: Int
    var players: [LadderPlayer]
    var ladder: Ladder {
        get {
            return buildLadder()
        }
    }
    
    init(height: Int, playerNames: [String]) {
        self.height = height
        self.players = playerNames.map{ (name) in LadderPlayer(of: name) }
    }
    
    private func buildLadder() -> Ladder {
        var ladder = Array(repeating: [LadderStep](), count: height)
        
        for i in 0..<ladder.count {
            ladder[i] = createStepsInRow(for: players.count)
        }
        return ladder
    }
    
    // create steps in one row
    private func createStepsInRow(for numberOfPlayer: Int) -> [LadderStep] {
        let stepTypes: [Bool] = [true, false]
        let rowSize = numberOfPlayer - 1
        var ladderRow = Array(repeating: stepTypes.randomElement()!, count: rowSize)
        
        for i in 1..<ladderRow.count {
            ladderRow[i] = ladderRow[i-1] ? false : stepTypes.randomElement()!
        }
        return ladderRow.map { (doesExist) in LadderStep(stepType: doesExist) }
    }
}
