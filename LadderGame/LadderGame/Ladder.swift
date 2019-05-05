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
    
    //Bool 사다리 이중배열 만들어서 horizontalData에 넣는다
    mutating func makeLadderData(peopleNum: Int, ladderNum: Int) {
        let ladderWidth = peopleNum
        let ladderHeight = ladderNum
        
        self.horizontalData = Array(repeating: Array(repeating: true, count: ladderWidth-1 ), count: ladderHeight)
        
        for dataIndex in 0 ..< ladderHeight {
            self.horizontalData[dataIndex] = LadderFloor.makeFloorRawData(rawData: self.horizontalData[dataIndex])
        }
    }
}
