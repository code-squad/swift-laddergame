//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

//유저가 입력하는 사람수와 사다리수를 받는 함수
func inputUserPeopleAndLadderCount()->[Int]{
    print("참여할 사람은 몇 명 인가요?")
    let peopleStr = readLine()!
    let peopleInt = Int(peopleStr)!
    
    print("최대 사다리 높이는 몇 개인가요?")
    let ladderStr = readLine()!
    let ladderInt = Int(ladderStr)!
    
    let peopleNum = peopleInt
    let ladderNum = ladderInt
    
    return [peopleNum, ladderNum]
}


//랜덤한숫자를 받아서 Bool값으로 저장하는 함수
func randomNumChangeBoolArray(ladderHeightAndWidth:[Int])->[[Bool]]{
    let ladderWidth = ladderHeightAndWidth[0]
    let ladderHeight = ladderHeightAndWidth[1]
    
    var boolArr : [[Bool]] = Array(repeating: Array(repeating: true,count:ladderWidth-1 ), count: ladderHeight)

    for boolArrIndex in 0..<ladderHeight {
        for boolArrInArrIndex in 0..<ladderWidth - 1 {
            if arc4random_uniform(2) % 2 == 1 {
                boolArr[boolArrIndex][boolArrInArrIndex]=(true)
            }else {
                boolArr[boolArrIndex][boolArrInArrIndex]=(false)
            }
        }
    }
    return boolArr
}

//이중배열에 들어있는 Bool값을 그림으로 전환하여 저장하는 함수
func boolArrayChangeStringArray(ladderHeight: Int, ladderWidth:Int, boolArray: [[Bool]])->[[String]]{
    var ladderArr : [[String]] = Array(repeating: Array(repeating: "-", count: peopleNum-1), count: ladderNum)

    for ladderArrIndex in 0..<ladderNum {
        for ladderArrInArrIndex in 0..<peopleNum - 1 {
            if boolArray[ladderArrIndex][ladderArrInArrIndex] == true {
                ladderArr[ladderArrIndex][ladderArrInArrIndex]=("-")
            } else {
                ladderArr[ladderArrIndex][ladderArrInArrIndex]=(" ")
            }
        }
    }
    return ladderArr
}


//배열에있는 그림으로 사다리1행 만드는 함수
func makekLadderLine (ladderArrIndex : Int, stringLadder : [[String]]) {
    var verticalLine = "|"
    for ladderArrInArr in 0..<peopleNum-1 {
        verticalLine = verticalLine + stringLadder[ladderArrIndex][ladderArrInArr]
        verticalLine = verticalLine + "|"
    }
    print(verticalLine)
    verticalLine = " "
}


//사다리높이만큼 사다리그림을 1행씩 증가시키는 함수
func increaseByladderLine (ladderHeight : Int, stringLadder: [[String]]) {
    for ladderNumCount in 0..<ladderHeight {
        makekLadderLine(ladderArrIndex: ladderNumCount, stringLadder: stringLadder)
    }
}

//게임 실행하는 함수
func playGame() {
    //inputUserPeopleAndLadderCount()
    let boolArr = randomNumChangeBoolArray(ladderHeightAndWidth: inputUserPeopleAndLadderCount())
    let StrArr = boolArrayChangeStringArray(ladderHeight: ladderNum, ladderWidth: peopleNum, boolArray: boolArr)
    increaseByladderLine(ladderHeight: ladderNum, stringLadder: StrArr)
}

playGame()
