//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

print("참여할 사람은 몇 명 인가요?")
let peopleCount : Int = Int(readLine() ?? "0") ?? 0
print("최대 사다리의 높이는 몇 개인가요?")
let ladderCount : Int = Int(readLine() ?? "0") ?? 0

var result : String = ""
for _ in 0..<ladderCount {
    for _ in 0..<peopleCount {
        result += "| "
    }
    result += "\n"
}
print(result)
