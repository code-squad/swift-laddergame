//
//  LadderGame.swift
//  Laddergame
//
//  Created by yangpc on 2017. 10. 16..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import Foundation

// 사다리 높이 속성과 참여자를 Array로 포함하는 LadderGame struct
struct LadderGame {
    let names: [LadderPlayer]
    var height = 0
    let ladder: [[Bool]]
    
    init(height: Int, player: [String]) {
        var playerArray = [LadderPlayer]()
        for name in player {
            let p = LadderPlayer(name: name)
            playerArray.append(p)
        }
        self.names = playerArray
        self.height = height
        let pNum = player.count
        var ladderArray = [[Bool]](repeating: Array(repeating: false ,count: pNum-1), count: height)
        for i in 0..<height {
            for j in 0..<pNum-1 {
                ladderArray[i][j] = arc4random_uniform(2) == 0 ? true : false
            }
        }
        self.ladder = ladderArray
    }
}
