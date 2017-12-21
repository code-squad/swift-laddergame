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

func editArrHeightOfLadder(_ player: Int) {
    let heightOfLadder = getHeightOfLadder()
    var arr = [[String]](repeating: Array(repeating: " ", count: player-1), count: heightOfLadder)
    for height in 0..<heightOfLadder {
        editArrNumOfPlayer(arr, player, height)
    }
}

func editArrNumOfPlayer(_ arr:[[String]],_ player: Int,_ height: Int) {
    for playerNum in 0..<player-1 {
        printLadder(arr, height, playerNum)
    }
    print()
}

func getNumOfLadder() -> String {
    let randomNum: UInt32 = arc4random_uniform(2)
    let numOfLadder = Int(randomNum)
    guard numOfLadder == 1 else { return " " }
    return "-"
}

func printLadder(_ arr:[[String]],_ h: Int,_ p: Int) {
    let colStr = "|"
    var tempArr = arr
    tempArr[h][p] = getNumOfLadder()
    guard p < 1 else { print( tempArr[h][p] + colStr, terminator:""); return }
    print(colStr + tempArr[h][p] + colStr, terminator:"")
}

while true {
    let player = getNumOfPlayer()
    guard player < 2 else { editArrHeightOfLadder(player); break }
    print("1명 이상 참여가능 \n")
}

