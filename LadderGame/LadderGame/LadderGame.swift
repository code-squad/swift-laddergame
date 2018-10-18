//
//  LadderGame.swift
//  ladderCony
//
//  Created by Elena on 18/10/2018.
//  Copyright © 2018 elena. All rights reserved.
//

import Foundation

struct LadderGame {
    
    private var height: Int
    private var players: [LadderPlayer]
    
    init?(height: Int , players: [LadderPlayer]){
        if height <= 0 || players.isEmpty {
            return nil
        }
        self.height = height
        self.players = players
    }
    
    func createRandomValue() -> Int {
        let randomNumber = arc4random_uniform(2)
        guard randomNumber == 0 else { return 1 }
        return 0
    }
    
    func createPlayersLadder(_ players: Int) -> Array<Int> {
        //여기 -1 안하면 사다리가 하나 늘어난다!!!!!
        let players = players-1
        var playLine = [Int](repeating: 0 , count: players)
        for index in 0..<players {
            playLine[index] = (Int(createRandomValue()))
            playLine = confirmationLineStick(playLine , index)
        }
        return playLine
    }
    
    func createLadderStage() -> [[Int]] {
        var twoLadderLine = [[Int]](repeating: Array(repeating:0,count: players.count ), count: height)
        for index in 0..<height {
            twoLadderLine[index] = createPlayersLadder(players.count)
        }
        return twoLadderLine
    }
    
    func confirmationLineStick(_ line:Array<Int> , _ index: Int) ->Array<Int> {
        var confirmationLine = line
        if index != 0 , confirmationLine[index-1] == 1 {
            confirmationLine[index] = 0
        }
        return confirmationLine
    }
    
}
