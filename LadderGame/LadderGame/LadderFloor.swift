//
//  LadderFloor.swift
//  LadderGame
//
//  Created by JieunKim on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderFloor {
    private(set) var steps: [LadderStep] = []
    private var ladderWidth: Int
    
    init(numberOfPlayer: Int) {
        self.ladderWidth = numberOfPlayer - 1
        
        for _ in 0..<ladderWidth {
            steps.append(LadderStep.init())
        }
        
        hasPrevStep()
    }
    
    
    private mutating func hasPrevStep() {
        for current in 1..<ladderWidth {
            let previous = current - 1
            guard steps[previous].beforeConnected else {
                continue
            }
            steps[current].beforeConnected = false
        }
    }
    
    
}

