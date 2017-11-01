//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func inputGameOption () -> (userNum: Int, ladderNum: Int) {
    print("참여할 사람은 몇 명 인가요?")
    let userNum = Int(readLine()!)
    print("최대 사다리 높이는 몇 개인가요?")
    let ladderNum = Int(readLine()!)
    return (userNum!, ladderNum!)
}

let gameOption = inputGameOption()

func oneLadder (countOfUser: Int) -> Array<String> {
    var oneLadderLine = [String](repeating:" ", count: ((countOfUser * 2)))
    for i in 0..<(countOfUser*2) where i % 2 == 0 {
        oneLadderLine[i] = "|"
    }
    for j in 1..<((countOfUser*2)-1) where j % 2 != 0 {
        oneLadderLine[j] = setRandomBar()
    }
    return oneLadderLine
}

func setRandomBar() -> String {
    var randomIndex: Int = 0
    randomIndex = Int(arc4random_uniform(2))
    if randomIndex == 0 {
        return "-"
    } else {
        return " "
    }
}

func generateLadder() -> Array<Array<String>> {
    var ladder : [[String]] = [[]]
    for _ in 0..<gameOption.ladderNum {
        ladder.append(oneLadder(countOfUser: gameOption.userNum))
    }
    return ladder
}

func printLadder() {
    let mainLadder = generateLadder()
    for i in 0..<mainLadder.count {
        for j in 0..<mainLadder[i].count {
            print(mainLadder[i][j], terminator: "")
        }
        print("")
    }
}

printLadder()

