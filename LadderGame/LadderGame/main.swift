//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func getInpitValue() {
    print("참여할 사람은 몇 명 인가요?")
    let inputPlayer = Int(readLine()!)
    guard let player = inputPlayer else { return }
    print("최대 사다리 높이는 몇 개인가요?")
    let inputHeightOfLadder = Int(readLine()!)
    guard let heightOfLadder = inputHeightOfLadder else { return }
    let randomNum: UInt32 = arc4random_uniform(2)
    let numOfLadder = Int(randomNum)
    var arr: [[Int]] = Array(repeating: Array(repeating: numOfLadder, count: player), count: heightOfLadder)
    //    if numOfLadder == 0 { print("| |") }
    //    if numOfLadder == 1 { print("|-|") }
    print(arr)
}

getInpitValue()
