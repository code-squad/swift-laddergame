//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation


var peopleNum = 0
var ladderNum = 0

//유저가 입력하는 사람수와 사다리수를 받는 함수
func inputUserPeopleAndLadderCount()->Array<Int> {
    print("참여할 사람은 몇 명 인가요?")
    let peopleStr = readLine()!
    let peopleInt = Int(peopleStr)!
    
    print("최대 사다리 높이는 몇 개인가요?")
    let ladderStr = readLine()!
    let ladderInt = Int(ladderStr)!
    
    peopleNum = peopleInt
    ladderNum = ladderInt
    
    return [peopleInt, ladderInt]
}
inputUserPeopleAndLadderCount()

//ladder그림을 받을 이중배열 생성
var ladderArr : [[String]] = Array(repeating: Array(repeating: "-", count: peopleNum-1), count: ladderNum)


//랜덤한숫자를 받아서 Bool값으로 저장하는 함수
func randomNumChangeBoolArray(ladderHeight: Int, ladderWidth:Int)->[[Bool]]{
    var boolArr : [[Bool]] = Array(repeating: Array(repeating: true,count:peopleNum-1 ), count: ladderNum)

    for boolArrIndex in 0..<ladderNum {
        for boolArrInArrIndex in 0..<peopleNum - 1 {
            if arc4random_uniform(2) % 2 == 1 {
                boolArr[boolArrIndex][boolArrInArrIndex]=(true)
            }else {
                boolArr[boolArrIndex][boolArrInArrIndex]=(false)
            }
        }
    }
    return boolArr
}
print(randomNumChangeBoolArray(ladderHeight: ladderNum, ladderWidth: peopleNum))


/*
//이중배열에 들어있는 Bool값을 그림으로 전환
for ladderArrIndex in 0..<ladderNum {
    for ladderArrInArrIndex in 0..<peopleNum - 1 {
        if boolArr[ladderArrIndex][ladderArrInArrIndex] == true {
            ladderArr[ladderArrIndex][ladderArrInArrIndex]=("-")
        } else {
            ladderArr[ladderArrIndex][ladderArrInArrIndex]=(" ")
        }
    }
}
//print(ladderArr)


//그림으로 배열에있는 사다리를 출력하는 함수
func ladderGame (ladderArrIndex : Int) {
    var verticalLine = "|"
    for ladderArrInArr in 0..<peopleNum-1 {
        verticalLine = verticalLine + ladderArr[ladderArrIndex][ladderArrInArr]
        verticalLine = verticalLine + "|"
    }
    print(verticalLine)
    verticalLine = " "
}

//사다리게임호출
for ladderNumCount in 0..<ladderNum {
    ladderGame(ladderArrIndex: ladderNumCount)
}

*/
