//
//  LadderGame.swift
//  LadderGame
//
//  Created by Daheen Lee on 12/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    var height: Int
    var players: [LadderPlayer]
    var board: [[LadderStep]] {
        get {
            return buildBoard()
        }
    }
    
    init(height: Int, playerNames: [String]) {
        self.height = height
        self.players = playerNames.map{ (name) in LadderPlayer(of: name) }
    }
    
    func buildBoard() -> [[LadderStep]]{
        var board = Array(repeating: [LadderStep](), count: height)
        
        for i in 0..<board.count {
            board[i] = createStepsInRow(for: players.count)
        }
        return board
    }
    
    // create steps in one row with true or false, and return it
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
