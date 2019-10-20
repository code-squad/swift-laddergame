//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation


print("참여할 사람은 몇 명 인가요?")
let peopleNum = Int(readLine() ?? "") ?? 0

print("최대 사다리 높이는 몇 개인가요?")
let ladderNum = Int(readLine() ?? "") ?? 0

var ladderAry = Array<Array<Bool>>()

for _ in 1...ladderNum {
    var ladderRowAry = Array<Bool>()
    ladderRowAry.append(false)
    for _ in 1..<peopleNum {
        ladderRowAry.append(Bool.random())
    }
    ladderAry.append(ladderRowAry)
}

for ladderRowAry in ladderAry
{
    for step in ladderRowAry {
        print(step ? "-|" : " |", terminator: "")
    }
    print("")
}
