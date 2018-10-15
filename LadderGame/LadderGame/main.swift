//
//  main.swift
//  ladderCony
//
//  Created by Elena on 12/10/2018.
//  Copyright © 2018 elena. All rights reserved
//

import Foundation

func getUserParticipant() -> Int {
    print("참여할 사람은 몇 명 인가요?")
    let inputParticipant = Int(readLine()!)
    guard let participant = inputParticipant else { return 0 }
    return participant
}

func getUserLadder() -> Int {
    print("최대 사다리 높이는 몇 개인가요?")
    let inputLadder = Int(readLine()!)
    guard let ladder = inputLadder else { return 0 }
    return ladder
}

func randomValue() -> Int {
    let randomNumber = arc4random_uniform(2)
    guard randomNumber == 0 else { return 1 }
    return 0
}

func participantLine(_ participant: Int) -> Array<Int> {
    var participantLine = [Int](repeating: 0 , count: participant)
    for index in 0..<participant {
        participantLine[index] = (Int(randomValue()))
        participantLine = confirmationLineStick(participantLine , index)
    }
    return participantLine
}

func ladderLines(ladder: Int , participant: Int) -> [[Int]] {
    var twoLadderLine = [[Int]](repeating: Array(repeating:0,count: participant ), count: ladder)
    for index in 0..<ladder {
        twoLadderLine[index] = participantLine(participant)
    }
    return twoLadderLine
}

func confirmationLineStick(_ line:Array<Int> , _ index: Int) ->Array<Int> {
    var confirmationLine = line
    if index != 0 , confirmationLine[index-1] == 1 {
        confirmationLine[index] = 0
    }
    return confirmationLine
}

func rowPrint(_ row: [Int]) {
    for index in row {
        index == 1 ? print("-",terminator:"|") : print(" ", terminator : "|")
    }
}

func printLadder(_ ladderTwoLine : [[Int]]) {
    for index in ladderTwoLine {
        print("",terminator:"|")
        rowPrint(index)
        print("")
    }
}

//MARK : game START
func ladderGameStart() {
    let ladderGame = (getUserParticipant(),getUserLadder())
    if ladderGame.0 != 0 && ladderGame.1 != 0 {
        let ladderTwoLines : [[Int]] = ladderLines(ladder: ladderGame.1, participant: ladderGame.0)
        printLadder(ladderTwoLines)
    }
}

ladderGameStart()
