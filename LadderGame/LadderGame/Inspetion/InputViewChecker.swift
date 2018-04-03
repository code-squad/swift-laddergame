//
//  InputViewChecker.swift
//  LadderGame
//
//  Created by Jung seoung Yeo on 2018. 4. 2..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

struct InputViewChecker {
    static func checker(_ players: [LadderPlayer], _ height: Int) -> Bool {
        return playerChecker(players) && heightChecker(height)
    }
    
    static private func playerChecker(_ players: [LadderPlayer]) -> Bool {
        let playerCount = players.count
        guard playerCount <= 0 || playerCount > 10 else {
            return true
        }
        
        return false
    }
    
    static private func heightChecker(_ height: Int) -> Bool {
        let result = (height > 0) && (height != 0) && (height < 10)
        
        return result
    }
}
