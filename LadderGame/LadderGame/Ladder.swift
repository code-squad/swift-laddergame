//
//  Ladder.swift
//  LadderGame
//
//  Created by CHOMINJI on 15/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Ladder {
    
    var ladderFrame: [LadderFloor] = []
    
    init(numberOfPlayer: Int, ladderHeight: Int) {
        
        for _ in 0..<ladderHeight {
            ladderFrame.append(LadderFloor.init(numberOfPlayer: numberOfPlayer))
        }
    }
    
}

