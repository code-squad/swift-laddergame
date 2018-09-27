//
//  LadderStep.swift
//  LadderGame
//
//  Created by 조재흥 on 2018. 9. 20..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderStep {
    let isStep = [true, false]
    
    func randomStep() -> Bool {
        return arc4random_uniform(2) == 1
    }
}
