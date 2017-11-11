//
//  LadderInfo.swift
//  LadderGame
//
//  Created by YOUTH on 2017. 11. 11..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

//LadderGame에서 만들어진 사다리 출력을 위한 정보만 가진 Data Object
struct LadderInfo {
    var ladderHeight : Int
    var playerNames : [String]
    var randomBars : [[Bool]]
    
    init(_ height: Int, _ playerNames: [String], _ randomBars: [[Bool]]) {
        self.ladderHeight = height
        self.playerNames = playerNames
        self.randomBars = randomBars
    }
}
