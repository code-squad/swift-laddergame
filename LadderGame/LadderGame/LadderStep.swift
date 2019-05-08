//
//  LadderStep.swift
//  LadderGame
//
//  Created by JH on 28/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderStep {
    
    static func makeStepElement(elements: [Bool], checkIndex: Int) -> Bool {
        
        if checkIndex > 0 && elements[checkIndex - 1] == true {
            return false
        }
        return Bool.random()
    }
    
    static func makeLadderStep(targets: [Bool], changeTargetIndex: Int) -> String {
        
        if targets[changeTargetIndex] == true {
            return "-----"
        }
        return "     "
    }
}
