//
//  main.swift
//  ladderCony
//
//  Created by Elena on 12/10/2018.
//  Copyright © 2018 elena. All rights reserved.
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

func participantArray(_ participant: Int) -> Array<Int> {
    var participantArray = [Int](repeating: 0 , count: participant)
    for index in 0..<participant {
        participantArray[index] = (Int(randomValue()))
        participantArray = confirmationLineStick(participantArray , index)
    }
    return participantArray
}

func ladderArray(ladder: Int , participant: Int) -> [[Int]] {
    var twoLadderArray = [[Int]](repeating: Array(repeating:0,count: participant ), count: ladder)
    for index in 0..<ladder {
        twoLadderArray[index] = participantArray(participant)
    }
    return twoLadderArray
}

func confirmationLineStick(_ lineArray:Array<Int> , _ index: Int) ->Array<Int> {
    var confirmationArray = lineArray
    if index != 0 , confirmationArray[index-1] == 1 {
        confirmationArray[index] = 0
    }
    return confirmationArray
}

func rowPrint(_ row: [Int]) {
    for index in row {
        index == 1 ? print("-",terminator:"|") : print(" ", terminator : "|")
    }
}

func printLadder(_ ladderTwoArray : [[Int]]) {
    for index in ladderTwoArray {
        print("",terminator:"|")
        rowPrint(index)
        print("")
    }
}

//MARK : error value
func printError(_ status: Int){
    if status == 9 {
        print("잘못된 값 입력했다. 확인바람")
    }
}
//MARK : game START
func ladderGameStart() -> Int{
    let ladderGame = (getUserParticipant(),getUserLadder())
    if ladderGame.0 == 0 || ladderGame.1 == 0 {
        return 9
    }
    let ladderTwoArray : [[Int]] = ladderArray(ladder: ladderGame.1, participant: ladderGame.0)
    printLadder(ladderTwoArray)
    
    return 0
}

////MARK : 시작
printError(ladderGameStart())

