//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func getNumOfPlayer() -> Int {
    print("참여할 사람은 몇 명 인가요?")
    let inputPlayer = Int(readLine()!)
    guard let player = inputPlayer else { return 0 }
    return player
}

func getHeightOfLadder() -> Int {
    print("최대 사다리 높이는 몇 개인가요?")
    let inputHeightOfLadder = Int(readLine()!)
    guard let heightOfLadder = inputHeightOfLadder else { return 0 }
    return heightOfLadder
}

func EditLadder() {
    let player = getNumOfPlayer()
    let heightOfLadder = getHeightOfLadder()
    var arr: [[Int]] = Array(repeating: Array(repeating: 0, count: player), count: heightOfLadder)
    for i in 0..<heightOfLadder {
        for j in 0..<player-1 {
            let randomNum: UInt32 = arc4random_uniform(2)
            let numOfLadder = Int(randomNum)
            arr[i][j] = numOfLadder
            if player < 3 {
                if numOfLadder == 0 { print("| |", terminator:"") }
                if numOfLadder == 1 { print("|-|", terminator:"") }
            }
            if player > 2 {
                if j < 1 {
                    if numOfLadder == 0 { print("| |", terminator:"") }
                    if numOfLadder == 1 { print("|-|", terminator:"") }
                }
                if j > 0 {
                    if numOfLadder == 0 { print(" |", terminator:"") }
                    if numOfLadder == 1 { print("-|", terminator:"") }
                }
            }
        }
        print()
    }
}

EditLadder()


