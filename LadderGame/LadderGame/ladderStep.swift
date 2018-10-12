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
    private var have:Bool = true
    
    init(have: Bool) {
        self.have = have
    }
    
    public mutating func isExist(_ num: Int) -> Bool {
        if num == 0 {return have}
        return false
    }
}
