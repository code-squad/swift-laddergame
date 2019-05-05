//
//  LadderGame.swift
//  LadderGame
//
//  Created by JH on 29/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    
    var ladder = Ladder()
    var outputForm = OutputForm()

    mutating func processingGame(playerNames: [String], playCount: Int) -> [[String]] {
        //사다리 가로 Bool값 배열 만들기
        ladder.makeLadderData(peopleNum: playerNames.count, ladderNum: playCount)
        let data = ladder.horizontalData
        
        //사다리 Bool -> String
        outputForm.makeHorizontalLadders(makeData: data)
        let horizontal = outputForm.horizontalLadders
        return horizontal
    }
}
