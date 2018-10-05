//
//  Step.swift
//  LadderGame
//
//  Created by Jun ho Lee on 2018. 10. 3..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

//사다리 한개
struct LadderStep {
    
    private(set) var stepDecision = true
    
    //사다리 랜덤 결정
    func makeRandomStep() -> LadderStep {
        var step = LadderStep()
        step.stepDecision = arc4random_uniform(UInt32(2)) == 1
        return step
    }
    
    //사다리 공백 생성
    func makeEmptyStep() -> LadderStep {
        var step = LadderStep()
        step.stepDecision = false
        return step
    }

}
