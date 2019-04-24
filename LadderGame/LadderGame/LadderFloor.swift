//
//  LadderFloor.swift
//  LadderGame
//
//  Created by JieunKim on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderFloor {
    private var steps = [LadderStep]()
    private var ladderWidth: Int
    func getSteps()-> [LadderStep] {
        return steps
    }
    
    //
    init(numberOfPlayer: Int) {
        self.ladderWidth = numberOfPlayer - 1
        steps = (0..<ladderWidth).map{_ in LadderStep.init()}
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

