//
//  LadderStep.swift
//  LadderGame
//
//  Created by JH on 28/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderStep {
    
    static func makeStepRawData(target: [Bool], checkIndex: Int) -> Bool {
        var checkTarget = target
        if checkIndex > 0 && checkTarget[checkIndex - 1] == true {
            return false
        }
        return Bool.random()
    }
    
    static func makeStep(target: [Bool], changeTargetIndex: Int) -> String {
        var changeTarget = target
        
        if changeTarget[changeTargetIndex] == true {
            return "-----"
        }
        return "     "
    }
}
