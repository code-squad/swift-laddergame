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

func generateLadders(_ player: Int,_ heightOfLadder: Int) -> [[String]]{
    var ladders = [[String]](repeating: Array(repeating: " ", count: player-1), count: heightOfLadder)
    return ladders
}

func drawHorizontalLadder(_ array: [[String]]) {
    for heightIdx in 0..<array.count {
        drawVerticalLadder(array[heightIdx])
    }
}

func drawVerticalLadder(_ array: [String]) {
    for playerIdx in 0..<array.count {
        drawNumberOfLadder()
    }
    print("|")
}

func getNumberOfLadder() -> String {
    let randomNum: UInt32 = arc4random_uniform(2)
    let numOfLadder = Int(randomNum)
    guard numOfLadder == 1 else { return " " }
    return "-"
}

func drawNumberOfLadder() {
    print("|" + getNumberOfLadder(), terminator:"")
}

while true {
    let player = getNumOfPlayer()
    guard player > 1 else { print("1명 이상 참여가능 \n"); continue }
    let height = getHeightOfLadder()
    let generateArr = generateLadders(player, height)
    drawHorizontalLadder(generateArr)
    break
}




