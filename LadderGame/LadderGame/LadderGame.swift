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
    var height = 0
    var names: [LadderPlayer]
    
    init(height: Int, player: [LadderPlayer]) {
        self.height = height
        self.names = player
    }
    
    func hasLadder() -> Bool {
        return arc4random_uniform(2) == 0 ? true : false
    }
    
    func makeLadderArray() -> [[Bool]] {
        let pNum = self.names.count
        var ladderArray = [[Bool]](repeating: Array(repeating: false ,count: pNum-1), count: self.height)
        for i in 0..<self.height {
            for j in 0..<pNum-1 {
                ladderArray[i][j] = hasLadder()
            }
        }
        return ladderArray
    }
}
