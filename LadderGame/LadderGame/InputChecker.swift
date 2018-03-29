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
        
        let invalidPlayers: [LadderPlayer] = players.filter{ $0.name.count > 5}
        return players.isEmpty || !invalidPlayers.isEmpty
    }
}
