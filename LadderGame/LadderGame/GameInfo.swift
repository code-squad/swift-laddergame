//
//  LadderInfo.swift
//  test2
//
//  Created by Mrlee on 2017. 10. 30..
//  Copyright © 2017년 Mrlee. All rights reserved.
//

import Foundation

struct GameInfo {
    var names: String? = nil
    var rowNumber: Int = 0
    var columnNumber: Int = 0
    
    init(){}
    init(player: String, row: Int) {
        self.names = player
        self.rowNumber = row
        self.columnNumber = player.split(separator: ",").count
    }
}
