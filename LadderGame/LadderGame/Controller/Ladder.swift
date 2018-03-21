//
//  Ladder.swift
//  LadderGame
//
//  Created by Jung seoung Yeo on 2018. 3. 20..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

private func getLadderConnectArray(_ userCount: Int) -> Array<String>{
        
    var ladderConnectArray: Array<String> = []
        
    for _ in 1 ... userCount {
        ladderConnectArray.append(isConnect())
    }

    return ladderConnectArray
}

private func isConnect() -> String {
    return (randomNumber() % 2) == 0 ? LADDERGAME_LADDER_CONNECT : LADDERGAME_LADDER_DISCONNECT
}

private func randomNumber() -> Int {
    return Int(arc4random_uniform(UINT32_MAX))
}

private func getRopeArray(_ ropeCount: Int) -> Array<String>{
    
    var ropeArray: Array<String> = []
    for _ in 1 ... ropeCount {
        ropeArray.append(LADDERGAME_LADDER)
    }
    return ropeArray
}

func makeLadderArray(_ userCount: Int, _ ladderHeight: Int) throws -> Array<Array<String>> {
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
    
    var ladderAllLineArray: Array<Array<String>> = []
    
    for _ in 1 ... ladderHeight {
        let ropeArray = getRopeArray(userCount)
        let connectArray = getLadderConnectArray(userCount)
        var ladderLineArray: Array<String> = []
        
        guard ropeArray.count == connectArray.count else {
            throw LadderGameError.notEqualsError
        }
        
        for ladderIndex in 0 ..< ropeArray.count {
            ladderLineArray.append(ropeArray[ladderIndex])
            ladderLineArray.append(connectArray[ladderIndex])
        }
        
        ladderLineArray.remove(at: ladderLineArray.count - 1)
        ladderAllLineArray.append(ladderLineArray)
    }

    return ladderAllLineArray
}
