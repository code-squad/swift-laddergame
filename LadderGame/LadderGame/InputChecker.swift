//
//  InputChecker.swift
//  LadderGame
//
//  Created by moon on 2018. 3. 26..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//


/// Invalid check player names and height
struct InputChecker {
    
    func check(height: Int, players: [LadderPlayer]) -> Bool {
        return self.checkHeight(height) || self.checkName(players)
    }
    
    private func checkHeight(_ height: Int) -> Bool {
        return 1 > height || height > Int.max
    }
    
    private func checkName(_ players: [LadderPlayer]) -> Bool {
        var flag = false
        
        for player in players {
            flag = checkNameLength(player)
        }
        
        return flag || players.isEmpty
    }
    
    private func checkNameLength(_ player: LadderPlayer) -> Bool {
        return player.name.count > 5
    }
}
