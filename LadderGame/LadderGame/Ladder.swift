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
    var horizontalLadders = [[String]]()
    
    
    mutating func makeLadderData(peopleNum: Int, ladderNum: Int) {
        let ladderWidth = peopleNum
        let ladderHeight = ladderNum
        
        self.horizontalData = Array(repeating: Array(repeating: true, count: ladderWidth-1 ), count: ladderHeight)
        
        for dataIndex in 0 ..< ladderHeight {
            self.horizontalData[dataIndex] = ladderFloor.makeFloorRawData(rawData: self.horizontalData[dataIndex])
        }
    }
    
    mutating func makeHorizontalLadders(makeData: [[Bool]]) {
        let ladderWidth = makeData[0].count
        let ladderHeight = makeData.count
        
        self.horizontalLadders = Array(repeating: Array(repeating: "-", count: ladderWidth), count: ladderHeight)
        
        for index in 0 ..< ladderHeight {
            self.horizontalLadders[index] = ladderFloor.makeFloorLadders(data: makeData[index], ladders: self.horizontalLadders[index])
        }
    }
}
