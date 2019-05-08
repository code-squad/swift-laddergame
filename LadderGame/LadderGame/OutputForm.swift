//
//  OutputForm.swift
//  LadderGame
//
//  Created by JH on 30/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputForm {
    
    var ladders = [[String]]()
    
    @discardableResult mutating func transFormLadders(transData: [[Bool]]) -> [[String]]{
        let ladderWidth = transData[0].count
        let ladderHeight = transData.count
        
        self.ladders = Array(repeating: Array(repeating: "-", count: ladderWidth), count: ladderHeight)
        
        for index in 0 ..< ladderHeight {
            self.ladders[index] = LadderFloor.makeLadderFloors(floorElements: transData[index], ladders: self.ladders[index])
        }
        return ladders
    }
}
