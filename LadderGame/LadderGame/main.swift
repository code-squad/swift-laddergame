//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

print("참여할 사람은 몇 명 인가요?")
var personNum = readLine()

print("최대 사다리 높이는 몇 개인가요?")
var ladderHeight = readLine()

for _ in 0..<Int(ladderHeight!)! {
    for j in 0..<Int(personNum!)! {
        print("|", terminator: "")

        let rndNum = arc4random_uniform(2)
        if rndNum == 0 && j < 2 {
            print(" ", terminator: "")
        }else if rndNum == 1 && j < 2 {
            print("-", terminator: "")
        }
    }
    print()
}

