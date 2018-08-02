//
//  LadderGame.swift
//  LadderGame
//
//  Created by KIMMINSIK on 2018. 7. 29..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    
    func ladderRowCreater() -> String {
        let rowCreate: Bool = arc4random_uniform(2) == 0 ? true : false
        guard rowCreate == true else {
            return  "     " }
        return "-----"
    }
    
    // 사다리 프레임 생성 -> LadderGame
    /*
    func ladderFrameCreate(_ playerNumber: Array<String>, _ maxLadderNumber: Int) {
        var maxLadderNumber = maxLadderNumber
        let resultView = ResultView()
        
        while 0 < maxLadderNumber {
            resultView.printLadder(Int(playerNumber))
            print("ㅣ")
            maxLadderNumber -= 1
        }
    }
    */
}
