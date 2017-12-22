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

func generateArrOfLadder(_ player: Int,_ heightOfLadder: Int) -> [[String]]{
    var ladderArr = [[String]](repeating: Array(repeating: " ", count: player-1), count: heightOfLadder)
    return ladderArr
}

func editArrHeightOfLadder(_ array: [[String]],_ player: Int,_ height: Int) {
    for heightIdx in 0..<height {
        editArrNumOfPlayer(array, player, heightIdx)
    }
}

func editArrNumOfPlayer(_ array: [[String]],_ player: Int,_ height: Int) {
    for playerIdx in 0..<player-1 {
        getLadderOfArray(array, height, playerIdx)
    }
    print("|")
}

func getNumOfLadder() -> String {
    let randomNum: UInt32 = arc4random_uniform(2)
    let numOfLadder = Int(randomNum)
    guard numOfLadder == 1 else { return " " }
    return "-"
}

func getLadderOfArray(_ array:[[String]],_ heightIdx: Int,_ playerIdx: Int) {
    var tempArr = array
    tempArr[heightIdx][playerIdx] = getNumOfLadder()
    printLadder(tempArr, heightIdx, playerIdx)
}

func printLadder(_ arr: [[String]],_ h: Int,_ p: Int) {
    print("|" + arr[h][p], terminator:"")
}

while true {
    let player = getNumOfPlayer()
    let height = getHeightOfLadder()
    let generateArr = generateArrOfLadder(player, height)
    guard player < 2 else { editArrHeightOfLadder(generateArr, player, height); break }
    print("1명 이상 참여가능 \n")
}
