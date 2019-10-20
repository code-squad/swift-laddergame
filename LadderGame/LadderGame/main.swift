//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

print("참여할 사람은 몇 명 인가요?")
let numberOfPeople: Int = Int(readLine()!)!

print("최대 사다리 높이는 몇 개인가요?")
let heightOfLadder: Int = Int(readLine()!)!

var ladder = [[Bool]]()

func generateLadder() {
    for _ in 0..<heightOfLadder {
        
        var rowLine = [Bool]()
        for _ in 0..<numberOfPeople - 1 {
            rowLine.append(arc4random_uniform(2) == 0 ? true : false)
        }
        ladder.append(rowLine)
    }
}

func printLadder(_ ladder: [[Bool]]) {
    ladder.forEach { (row) in
        
        var rowPrintLine = "|"
        row.forEach { (isExist) in
            rowPrintLine += isExist ? "-" : " "
            rowPrintLine += "|"
        }
        print(rowPrintLine)
    }
}

generateLadder()
printLadder(ladder)
