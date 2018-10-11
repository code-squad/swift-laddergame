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
    
    //랜덤으로 사다리 요소 생성
    private(set) var stepDecision = arc4random_uniform(UInt32(2)) == 1
    
    //사다리 공백으로 변경
    private mutating func makeEmptyStep() {
        self.stepDecision = false
    }
    
    //중복 검사 결과에 따라 사다리 요소 결정
    func decideStep(pastStep: LadderStep) -> LadderStep {
        var nextStep = LadderStep()
        if pastStep.stepDecision {
            nextStep.makeEmptyStep()
            return nextStep
        }
        return nextStep
    }
    
}
