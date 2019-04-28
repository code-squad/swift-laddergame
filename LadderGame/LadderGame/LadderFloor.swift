//
//  LadderFloor.swift
//  LadderGame
//
//  Created by JH on 29/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation


struct LadderFloor {
    
    func makeFloorRawData(rawData: [Bool]) -> [Bool] {
        var floorRawData = rawData
//        let checkData = LadderStep()
        
        for index in 0 ..< floorRawData.count {
            floorRawData[index] = ladderStep.makeStepRawData(target: floorRawData, checkIndex: index)
        }
        return floorRawData
    }
}
