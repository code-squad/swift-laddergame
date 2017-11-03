//
//  LadderGameInfo.swift
//  LadderGame
//
//  Created by Eunjin Kim on 2017. 11. 2..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGameInfo {
    var nameOfPlayer = ""
    var names: [LadderPlayer] = []
    var heightForLadder: Int = 0
    
    init(nameOfPlayer: String, names: [LadderPlayer], height: Int) {
        self.names = names
        self.heightForLadder = height
    }
}
