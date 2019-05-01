//
//  OutputForm.swift
//  LadderGame
//
//  Created by JH on 30/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputForm {
    
    var horizontalLadders = [[String]]()
    
    mutating func makeHorizontalLadders(makeData: [[Bool]]) {
        let ladderWidth = makeData[0].count
        let ladderHeight = makeData.count
        
        self.horizontalLadders = Array(repeating: Array(repeating: "-", count: ladderWidth), count: ladderHeight)
        
        for index in 0 ..< ladderHeight {
            self.horizontalLadders[index] = LadderFloor.makeFloorLadders(data: makeData[index], ladders: self.horizontalLadders[index])
        }
    }
}
