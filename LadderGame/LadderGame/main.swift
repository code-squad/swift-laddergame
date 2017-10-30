//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//
import Foundation

func executeLadderGame() -> (peopleNumber: String?, ladderNumber: String?){
    print("참여할 사람은 몇 명인가요?")
    let peopleNumber = readLine()
    print("최대 사다리 높이는 몇 개인가요?")
    let ladderNumber = readLine()
    return (peopleNumber, ladderNumber)
}

func playLadderGame(people col: String?, ladder row: String?){
    guard let col = Int(col!), let row = Int(row!) else {
        print("입력오류")
        return
    }
    var ladder: LadderGame = LadderGame()
    ladder.makeLadder(col, row)
    ladder.makeRandomLine()
    ladder.printLadder()
}

let ladderGameInfo = executeLadderGame()
playLadderGame(people:ladderGameInfo.peopleNumber , ladder: ladderGameInfo.ladderNumber)
