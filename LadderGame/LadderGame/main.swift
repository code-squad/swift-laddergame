//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

while (true) {
    let inputUserNumber: String
    let inputLadderHeight: String
    
    print("참여할 사람은 몇 명 인가요?", terminator: " ")
    inputUserNumber = readLine()!
    
    print("최대 사다리 높이는 몇 개인가요?", terminator: " ")
    inputLadderHeight = readLine()!
    
    let input: Input = Input(col: inputUserNumber, row: inputLadderHeight)
    
    guard (input.confirmInputValue()) else {
        break
    }
    
    let result = LadderGame().drawLadder(col: input.colNumber, row: input.rowNumber)
    print(result)
}
