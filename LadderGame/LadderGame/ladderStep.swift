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
    private var none: Bool
    
    init(have: Bool, none: Bool) {
        self.have = have
        self.none = none
    }
    
    func isExist(_ num: Int) -> Bool {
        switch num {
        case 0:
            return have
        case 1:
            return none
        default:
            return none
        }
    }
}
