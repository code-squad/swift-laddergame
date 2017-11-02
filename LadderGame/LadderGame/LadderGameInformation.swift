//
//  GameInfo.swift
//  LadderGame
//
//  Created by yuaming on 2017. 11. 2..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGameInformation {
    var column: Int = 0
    var row: Int = 0
    var ladder: String = ""
    var playerNames: [LadderPlayer] = []
    
    var result: LadderGameInformation {
        get {
            return LadderGameInformation(column: self.column, row: self.row, ladder: self.ladder, playerNames: self.playerNames)
        }
        set {
            self.column = newValue.column
            self.row = newValue.row
            self.ladder = newValue.ladder
            self.playerNames = newValue.playerNames
        }
    }
}
