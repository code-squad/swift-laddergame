//
//  Ladder.swift
//  LadderGame
//
//  Created by JH on 29/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Ladder {
    
    var ladderElements = [[Bool]]()
    
    mutating func makeLadderElements(playerCount: Int, ladderCount: Int) {
        let ladderWidth = playerCount
        let ladderHeight = ladderCount
        
        self.ladderElements = Array(repeating: Array(repeating: true, count: ladderWidth-1 ), count: ladderHeight)
        
        for index in 0 ..< ladderHeight {
            self.ladderElements[index] = LadderFloor.makeFloorsElements(elements: self.ladderElements[index])
        }
    }
}
