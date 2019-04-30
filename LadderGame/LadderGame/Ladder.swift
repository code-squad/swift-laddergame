//
//  Ladder.swift
//  LadderGame
//
//  Created by JH on 29/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation


struct Ladder {
    
    var horizontalData = [[Bool]]()
    
    mutating func makeLadderData(peopleNum: Int, ladderNum: Int) {
        let ladderWidth = peopleNum
        let ladderHeight = ladderNum
        
        self.horizontalData = Array(repeating: Array(repeating: true, count: ladderWidth-1 ), count: ladderHeight)
        
        for dataIndex in 0 ..< ladderHeight {
            self.horizontalData[dataIndex] = ladderFloor.makeFloorRawData(rawData: self.horizontalData[dataIndex])
        }
    }
}
