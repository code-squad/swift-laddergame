//
//  LadderGameInfo.swift
//  LadderGame
//
//  Created by Eunjin Kim on 2017. 11. 2..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGameInfo {
    private(set) var nameOfPlayer = ""
    private(set) var names: [LadderPlayer] = []
    private(set) var heightForLadder: Int = 0
    
    init(nameOfPlayer: String, height: Int) {
        self.nameOfPlayer = nameOfPlayer
        self.heightForLadder = height
    }
    init(names: [LadderPlayer], height: Int) {
        self.names = names
        self.heightForLadder = height
    }
}
