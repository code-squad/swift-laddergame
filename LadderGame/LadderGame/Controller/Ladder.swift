//
//  Ladder.swift
//  LadderGame
//
//  Created by Jung seoung Yeo on 2018. 3. 20..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

private func getLadderConnectArray(_ userCount: Int) -> Array<Bool>{
        
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

func ladderUserCountWithLadderHeightChecker(_ userCount: Int, _ ladderHeight: Int) throws -> (Int, Int) {
    
    guard userCount != 0 else {
        throw LadderGameError.zeroError
    }
    
    guard userCount > 0 else {
        throw LadderGameError.minusError
    }
    
    guard userCount < 10 else {
        throw LadderGameError.limitError
    }
    
    guard ladderHeight != 0 else {
        throw LadderGameError.zeroError
    }
    
    guard ladderHeight > 0 else {
        throw LadderGameError.minusError
    }
    
    guard ladderHeight < 10 else {
        throw LadderGameError.limitError
    }
    
    return (userCount, ladderHeight)
}

func makeLadderArray(_ userCount: Int, _ ladderHeight: Int) throws -> Array<Array<Bool>> {
    
    let (provenUserCount, provenLadderHeight) = try ladderUserCountWithLadderHeightChecker(userCount, ladderHeight)
    var ladderArray: Array<Array<Bool>> = []
    
    for _ in 1 ... provenLadderHeight {
        ladderArray.append(getLadderConnectArray(provenUserCount))
    }
    
    return ladderArray
}
