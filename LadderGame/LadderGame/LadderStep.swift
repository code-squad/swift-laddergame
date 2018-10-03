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
    //사다리 요소
    var dataStep: Bool
    
    //사다리 랜덤 결정
    static func makeRandomStep() -> Bool {
        return arc4random_uniform(UInt32(2)) == 1
    }
    
    init() {
        self.dataStep = LadderStep.makeRandomStep()
    }
}
