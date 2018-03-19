//
//  LadderMakeController.swift
//  LadderGame
//
//  Created by Jung seoung Yeo on 2018. 3. 19..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

func makeLadder(userCount: Int, ladderHeight: Int) throws -> Array<Array<String>> {
    
    guard !(userCount < 0) else {
        throw LadderGameError.minusError
    }
    
    guard !(userCount == 0) else {
        throw LadderGameError.zeroError
    }
    
    guard !(ladderHeight < 0) else {
        throw LadderGameError.minusError
    }
    
    guard !(ladderHeight == 0) else {
        throw LadderGameError.zeroError
    }
    var ladder: Array<Array<String>>  = []
    
    for _ in 0 ..< ladderHeight {
        ladder.append(makeLadderLine(userCount: userCount))
    }
    
    return ladder
    
}

func makeLadderLine(userCount: Int) -> Array<String> {
    var landderline: Array<String> = []
    for ropecount in 1 ... userCount {
        landderline.append(LADDERGAME_LADDER)
        if ropecount != userCount {
            if isConnect() {
                landderline.append(LADDERGAME_LADDER_CONNECT)
            }else {
                landderline.append(LADDERGAME_LADDER_DISCONNECT)
            }
        }
    }
    
    //print(landderline)
    
    return landderline
}
