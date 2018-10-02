//
//  LadderStep.swift
//  LadderGame
//
//  Created by 윤동민 on 2018. 10. 1..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderStep{
    private var ladderOneStep : String
    
    init(){
        ladderOneStep = "|"
    }
    
    func getladderOneStep() -> String{
        return ladderOneStep
    }
    
    mutating func setLadderOneStep(one: String){
        ladderOneStep = one
    }
}
