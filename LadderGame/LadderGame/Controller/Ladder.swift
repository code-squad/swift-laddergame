//
//  Ladder.swift
//  LadderGame
//
//  Created by Jung seoung Yeo on 2018. 3. 20..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

private func getLadderConnect(_ userCount: Int) -> Array<Bool>{
        
    var ladderConnectArray: Array<Bool> = []
        
    for _ in 1 ..< userCount {
        ladderConnectArray.append(isConnect())
    }

    return ladderConnectArray
}

private func isConnect() -> Bool {
    return (randomNumber() % 2) == 0
}

private func randomNumber() -> Int {
    return Int(arc4random_uniform(UINT32_MAX))
}

private func inspetionUserCount(_ userCount: Int) throws -> Int{
    guard userCount != 0 else {
        throw LadderGameError.zeroError
    }
    
    guard userCount > 0 else {
        throw LadderGameError.minusError
    }
    
    guard userCount < 10 else {
        throw LadderGameError.limitError
    }
    return userCount
}

private func inspetionLadderHeight(_ ladderHeight: Int) throws -> Int {
    guard ladderHeight != 0 else {
        throw LadderGameError.zeroError
    }
    
    guard ladderHeight > 0 else {
        throw LadderGameError.minusError
    }
    
    guard ladderHeight < 10 else {
        throw LadderGameError.limitError
    }
    
    return ladderHeight
}

func makeLadderCunnectionForm(_ userCount: Int, _ ladderHeight: Int) throws -> Array<Array<Bool>> {
    
    let provenUserCount = try inspetionUserCount(userCount)
    let provenLadderHeight = try inspetionLadderHeight(ladderHeight)
    
    var ladderConnectForm: Array<Array<Bool>> = []
    
    for _ in 1 ... provenLadderHeight {
        ladderConnectForm.append(getLadderConnect(provenUserCount))
    }
    
    return ladderConnectForm
}
