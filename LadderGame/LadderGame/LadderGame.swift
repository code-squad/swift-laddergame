//
//  LadderGame.swift
//  LadderGame
//
//  Created by 이동영 on 16/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame{
    
    private let info:LadderInfo
    var ladder : Ladder?
    
    init(info:LadderInfo){
        self.info = info
    }
    
    func makeLadder()->(Ladder){
        let height = info.getHeight()
        let numOfSteps = info.getNumOfSteps()
        let ladder = Ladder.init(height:height , numOfSteps: numOfSteps)
        
        return ladder
    }
   
}
