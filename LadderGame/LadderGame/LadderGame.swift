//
//  LadderGame.swift
//  LadderGame
//
//  Created by KIMMINSIK on 2018. 7. 29..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    // 사다리 프레임 생성 -> LadderGame
    func ladderFrameCreater(_ playerNumber: Int, _ maxLadderNumber: Int) {
        var maxLadderNumber = maxLadderNumber
        let resultView = ResultView()
        
        while 0 < maxLadderNumber {
            resultView.printLadder(playerNumber)
            print("ㅣ")
            maxLadderNumber -= 1
        }
        resultView.playerNamePrint()
    }
}
