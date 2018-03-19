//
//  LadderGame.swift
//  LadderGame
//
//  Created by rhino Q on 2018. 3. 13..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

/*
 들여쓰기 depth를  1단계로 줄이기
 메소드의 라인 최대 10줄
 method가 한 가지일만 하도록
 */

import Foundation

extension Int{
    var arc4random:Int{
        return Int(arc4random_uniform(UInt32(self)))
    }
}


struct LadderGame {
    
    var ladderGameDTO:LadderGameDTO
    var ladderPlayer:LadderPlayer
    
    init(_ names:[String], _ heightOfLadder:Int) {
        ladderGameDTO = LadderGameDTO()
        ladderPlayer = LadderPlayer()
        for name in names{
            ladderPlayer.name = name
            ladderGameDTO.names.append(ladderPlayer)
        }
        
        ladderGameDTO.heightOfLadder = heightOfLadder
    }
    
    // ladderGame.makeLadder() 경고 제거
    @discardableResult
    mutating func makeLadder() -> LadderGameDTO{
        ladderGameDTO.ladderMatrix = Array(repeating: Array(repeating: false, count: ladderGameDTO.names.count-1), count: ladderGameDTO.heightOfLadder)
        
        ladderGameDTO.numberOfLadder = ( ladderGameDTO.names.count + ladderGameDTO.heightOfLadder ) / 2
        
        for _ in 0..<ladderGameDTO.numberOfLadder{
            ladderGameDTO.ladderMatrix[ladderGameDTO.heightOfLadder.arc4random][(ladderGameDTO.names.count-1).arc4random] = true
        }
        
        return ladderGameDTO
    }
}
