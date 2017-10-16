//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation
print("참여할 사람은 몇 명 인가요?")
let n = readLine()
print("최대 사다리 높이는 몇 개인가요?")
let m = readLine()

func randomBool() -> Bool {
    return arc4random_uniform(2) == 0 ? true : false
}

func makeLadderArray(pNum: Int, lNum: Int) -> [[Bool]]{
    var ladderArray = [[Bool]](repeating: Array(repeating: false ,count: pNum-1), count: lNum)
    for i in 0..<lNum {
        for j in 0..<pNum-1 {
            ladderArray[i][j] = randomBool()
        }
    }
    return ladderArray
}

func drawLadder(ladderArray: [[Bool]], pNum: Int, lNum: Int) {
    for i in 0..<lNum {
        for j in 0..<pNum-1 {
            print("|", terminator: "")
            if ladderArray[i][j] {
                print("-", terminator: "")
            } else {
                print(" ", terminator: "")
            }
        }
        print("|")
    }
}

if let n = n,
    let m = m {
    let numOfPerson = Int(n) as! Int
    let numOfLadder = Int(m) as! Int
    let result = makeLadderArray(pNum: numOfPerson, lNum: numOfLadder)
    drawLadder(ladderArray: result, pNum: numOfPerson, lNum: numOfLadder)
}
