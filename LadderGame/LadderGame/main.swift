//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func makeLadderBar() -> String {
    let isMake: Bool = arc4random_uniform(2) == 0 ? false : true
    
    if isMake {
        return "-"
    }
    
    return " "
}

func drawLadder(colNum col: Int, rowNum row: Int) {
    for _ in 0..<col {
        for _ in 0..<row-1 {
            print("ㅣ", terminator: makeLadderBar())
        }
        
        print("ㅣ", terminator: "\n")
    }
}

while (true) {
    print("참여할 사람은 몇 명 인가요?", terminator: " ")
    let inputUserCount: String = readLine()!
    
    if inputUserCount.isEmpty { break }
    
    print("최대 사다리 높이는 몇 개인가요?", terminator: " ")
    let inputLadderHeight: String = readLine()!
    
    if inputLadderHeight.isEmpty { break }
    
    drawLadder(colNum: Int(inputLadderHeight) ?? 0, rowNum: Int(inputUserCount) ?? 0)
}
