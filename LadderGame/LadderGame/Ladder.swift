//
//  Ladder.swift
//  LadderGame
//
//  Created by JH on 29/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation


struct Ladder {
    
    func makeLadderData(peopleNum: Int, ladderNum: Int) -> [[Bool]]{
        let ladderWidth = peopleNum
        let ladderHeight = ladderNum
        
        var horizontalData: [[Bool]] = Array(repeating: Array(repeating: true, count: ladderWidth-1 ), count: ladderHeight)
        
        for dataIndex in 0 ..< ladderHeight {
            horizontalData[dataIndex] = ladderFloor.makeFloorRawData(rawData: horizontalData[dataIndex])
        }
        return horizontalData
    }
}
