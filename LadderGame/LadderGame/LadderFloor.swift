//
//  LadderFloor.swift
//  LadderGame
//
//  Created by CHOMINJI on 15/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderFloor {
    var floor: [LadderStep] = []
    var ladderWidth: Int
    
    init(numberOfPlayer: Int) {
        self.ladderWidth = numberOfPlayer - 1
        
        for _ in 0..<ladderWidth {
            floor.append(LadderStep.init())
        }
        
        hasPrevStep()
    }
    
    private mutating func hasPrevStep() {
        for currentStep in 1..<ladderWidth {
            let previousStep = currentStep - 1
            guard floor[previousStep].hasStep else {
                continue
            }
            floor[currentStep].hasStep = false
        }
    }
    
}
