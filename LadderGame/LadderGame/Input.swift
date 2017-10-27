//
//  view.swift
//  LadderGame
//
//  Created by yuaming on 2017. 10. 26..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct Input {
    func askInputValue() {
        var inputUserNumber: String = ""
        var inputLadderHeight: String = ""
        
        while (true) {
            print("참여할 사람은 몇 명 인가요?", terminator: " ")
            inputUserNumber = readLine()!

            print("최대 사다리 높이는 몇 개인가요?", terminator: " ")
            inputLadderHeight = readLine()!
            
            let ladder: Ladder = Ladder(column: inputUserNumber, row: inputLadderHeight)
            let columnNumber: Int = ladder.property.0
            let rowNumber: Int = ladder.property.1
            
            if columnNumber == 0 || rowNumber == 0 {
                break
            }
            
            ResultView().printReuslt(LadderGame().drawLadder(column: columnNumber, row: rowNumber))
        }
    }
}
