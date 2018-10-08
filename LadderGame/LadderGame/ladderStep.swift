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
    private var have: Bool
    
    init(have: Bool) {
        self.have = have
    }
    
    func isExist(_ num: Int) -> Bool {
        switch num {
        case 0:
            return have
        default:
            return false
        }
    }
}
