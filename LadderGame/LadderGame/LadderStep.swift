//
//  LadderStep.swift
//  LadderGame
//
//  Created by 조재흥 on 2018. 9. 20..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderStep {
    let kindOfStep = ["-"," "]
    
    func randomStep() -> String {
        return kindOfStep[Int(arc4random_uniform(2))]
    }
}
