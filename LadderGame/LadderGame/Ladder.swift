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
    
    func makeHorizontalLadders(makeData: [[Bool]]) -> [[String]]{
        let ladderWidth = makeData[0].count
        let ladderHeight = makeData.count
        
        var horizontalLadders: [[String]] = Array(repeating: Array(repeating: "-", count: ladderWidth), count: ladderHeight)
        
        for index in 0 ..< ladderHeight {
            horizontalLadders[index] = ladderFloor.makeFloorLadders(data: makeData[index], ladders: horizontalLadders[index])
        }
        return horizontalLadders
    }
}
