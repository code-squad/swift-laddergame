//
//  LadderStep.swift
//  LadderGame
//
//  Created by 윤동민 on 2018. 10. 1..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderStep{
    private(set) var ladderOneStep : Bool
    
    init(){
        ladderOneStep = true
    }
    
    mutating func setLadderOneStep(one: Bool){
        ladderOneStep = one
    }
    
    // 사이에 "-----" 존재하는지 검사
    func isExistLadder() -> Bool{
        guard ladderOneStep == true else{
            return false
        }
        return true
    }
}
