//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGameValue {
    let playerNumber:Int //readLine()
    let ladderHeight:Int //readLine()
    
    var ladderWidthLength:Int {
        return ((playerNumber-1) * 2) + 1
    }
    
    lazy var ladders:[[Character]] =
        Array(repeating:Array(repeating: " ", count:ladderWidthLength), count: ladderHeight)
}
