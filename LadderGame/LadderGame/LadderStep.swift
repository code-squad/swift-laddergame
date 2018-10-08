//
//  LadderStep.swift
//  LadderGame
//
//  Created by 조재흥 on 2018. 9. 20..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderStep {
    static var stepInfo = [true : "-----", false : "     "]
    
    private(set) var hasStep = false
    
    mutating func randomStep() {
        self.hasStep = (arc4random_uniform(2) == 1)
    }
}
