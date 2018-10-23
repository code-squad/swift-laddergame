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
    
    init?(height: Int , players: [LadderPlayer]?){
        guard let player : [LadderPlayer] = players , height > 0 , player.isEmpty == false else {
            return nil
        }
        self.height = height
        self.players = player
    }
    func getnames () -> [LadderPlayer]{
        return players
    }
    
    private func createRandomValue() -> Bool {
        let randomNumber = arc4random_uniform(2)
        guard randomNumber == 0 else { return true }
        return false
    }
    
    private func createPlayersLadder(_ players: Int) -> Array<Bool> {
        let players = players-1
        var playLine = [Bool](repeating: false, count: players)
        for index in 0..<players {
            playLine[index] = createRandomValue()
            playLine = confirmationLineStick(playLine , index)
        }
        return playLine
    }
    
    func createLadderStage() -> [[Bool]] {
        var twoLadderLine = [[Bool]](repeating: Array(repeating:false,count: players.count ), count: height)
        for index in 0..<height {
            twoLadderLine[index] = createPlayersLadder(players.count)
        }
        return twoLadderLine
    }
    
    private func confirmationLineStick(_ line:Array<Bool> , _ index: Int) ->Array<Bool> {
        var confirmationLine = line
        if index != 0 , confirmationLine[index-1] == true {
            confirmationLine[index] = false
        }
        return confirmationLine
    }
    
}
