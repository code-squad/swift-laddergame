//
//  LadderFloor.swift
//  LadderGame
//
//  Created by JH on 29/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderFloor {
    
    static func makeFloorsElements(elements: [Bool]) -> [Bool] {
        var floorElements = elements
        
        for index in 0 ..< floorElements.count {
            floorElements[index] = LadderStep.makeStepElement(elements: floorElements, checkIndex: index)
        }
        return floorElements
    }
    
    static func makeLadderFloors(floorElements: [Bool], ladders: [String]) -> [String] {
    
        var ladderfloors = ladders
        for index in 0 ..< floorElements.count {
            ladderfloors[index] = LadderStep.makeLadderStep(targets: floorElements, changeTargetIndex: index)
        }
        return ladderfloors
    }
}
