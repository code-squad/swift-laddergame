//
//  LadderGame.swift
//  LadderGame
//
//  Created by CHOMINJI on 15/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    var names : [LadderPlayer]
    var height = 0
    
    var numberOfPlayer: Int {
        get {
            return names.count
        }
    }
    
    var ladder: Ladder {
        get {
            return Ladder(numberOfPlayer: numberOfPlayer, ladderHeight: height)
        }
    }
    
}

