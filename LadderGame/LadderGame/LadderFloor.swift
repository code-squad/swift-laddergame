//
//  LadderFloor.swift
//  LadderGame
//
//  Created by JieunKim on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderFloor {
    private var steps = [LadderStep]() // init(){}
    private var ladderWidth: Int
    public func getSteps()-> [LadderStep] {
        return steps
    }
    
    init(numberOfPlayer: Int) {
        self.ladderWidth = numberOfPlayer - 1
        steps = [LadderStep](repeating: LadderStep.init(), count: ladderWidth)
      
        setLadderStep()
    }
  
    private mutating func setLadderStep() {
        for current in 1..<ladderWidth {
            let previous = current - 1
            guard steps[previous].isConnceted else {
                continue
            }
            steps[current].isConnceted = false
        }
    }
    
    
}

