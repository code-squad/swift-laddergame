//
//  LadderGame.swift
//  LadderGame
//
//  Created by JH on 29/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation


struct LadderGame {
    
    var ladder = Ladder()
    var outputForm = OutputForm()
    
    mutating func processingGame(playerNames: [String], playCount: Int) -> [[String]] {
        
        ladder.makeLadderElements(playerCount: playerNames.count, ladderCount: playCount)
        let elements = ladder.ladderElements
        
        outputForm.transFormLadders(transData: elements)
        let ladders = outputForm.ladders
        
        return ladders
    }
}
