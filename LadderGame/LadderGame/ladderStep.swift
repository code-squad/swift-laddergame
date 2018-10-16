//
//  ladderStep.swift
//  LadderGame
//
//  Created by 김장수 on 2018. 10. 1..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

// LadderStep 객체는 발판하나만 표현

struct LadderStep {
    public var have:Bool = true
    
    public mutating func isExist(_ num: Int) -> LadderStep {
        if num == 0 {return LadderStep()}
        return LadderStep(have: false)
    }
}
