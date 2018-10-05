//
//  LadderStep.swift
//  LadderGame
//
//  Created by 윤동민 on 2018. 10. 1..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderStep{
    private(set) var ladderOneStep : String
    
    init(){
        ladderOneStep = "|"
    }
    
    mutating func setLadderOneStep(one: String){
        ladderOneStep = one
    }
    
    // 사이에 "-----" 존재하는지 검사
    func isExistLadder() -> Bool{
        guard ladderOneStep == "-----" else{
            return false
        }
        return true
    }
}
