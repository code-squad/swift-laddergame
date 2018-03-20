//
//  Ladder.swift
//  LadderGame
//
//  Created by Jung seoung Yeo on 2018. 3. 20..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

class Ladder {
    // 연결 부분 가져오기
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
    
    func makeLadderLine(_ userCount: Int) throws -> String {
        guard userCount != 0 else {
            throw LadderGameError.zeroError
        }
        
        guard userCount > 0 else {
            throw LadderGameError.minusError
        }
        
        let ropeArray = getRopeArray(userCount)
        let connectArray = getLadderConnectArray(userCount)
        
        guard ropeArray.count == connectArray.count else {
            throw LadderGameError.notEqualsError
        }
        
        var ladderline = ""
        
        for count in 0 ..< ropeArray.count {
            ladderline += ropeArray[count]
            
            if count != (ropeArray.count - 1) {
              ladderline += connectArray[count]
            }
        }
        
        return ladderline
    }
    
}
