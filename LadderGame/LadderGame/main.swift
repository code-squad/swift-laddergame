//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

//유저가 입력하는 사람수와 사다리수를 받는 함수
func inputUserPeopleAndLadderCounts() -> (Int, Int){
    print("참여할 사람은 몇 명 인가요?")
    let inputPeopleCount = readLine()!
    let peopleCount = Int(inputPeopleCount)!
    
    print("최대 사다리 높이는 몇 개인가요?")
    let inputLadderCount = readLine()!
    let ladderCount = Int(inputLadderCount)!
    
    let peopleNum = peopleCount
    let ladderNum = ladderCount
    
    return (peopleNum, ladderNum)
}


//중복값을 체크해서 사다리만들 값을 저장하는 이중배열만드는 함수
func hasHorizontalValues(peopleNum: Int, ladderNum: Int)->[[Bool]]{
    let ladderWidth = peopleNum
    let ladderHeight = ladderNum
    
    var horizontalValues : [[Bool]] = Array(repeating: Array(repeating: true,count: ladderWidth-1 ), count: ladderHeight)
    
    for horizontalValuesIndex in 0 ..< ladderHeight {
        horizontalValues[horizontalValuesIndex] = makeOneHorizontalValues(checkValues: horizontalValues[horizontalValuesIndex])
    }
    return horizontalValues
}


//중복체크된 값으로 1행 만드는 함수
func makeOneHorizontalValues (checkValues: [Bool]) -> [Bool] {
    var changeValues = checkValues
    for index in 0..<changeValues.count {
        changeValues[index] = checkValue(target: changeValues, checkIndex: index)
    }
    return changeValues
}




//true뒤에 true가 올 수 없게 체크하는 함수.(- -중복체크)
func checkValue (target: [Bool], checkIndex: Int) -> Bool {
    var checkTarget = target
    if checkIndex > 0 && checkTarget[checkIndex - 1] == true {
        return false
    }
    return Bool.random()
}
    

//사다리의 1가로줄만드는걸 가지고 사다리높이만큼 반복하는 함수
func horizontalValuesChangeHorizontalLadders(changValues: [[Bool]])->[[String]]{
    let ladderWidth = changValues[0].count
    let ladderHeight = changValues.count
    
    
    var horizontalLadders : [[String]] = Array(repeating: Array(repeating: "-", count: ladderWidth), count: ladderHeight)
    
    for horizontalLaddersIndex in 0..<ladderHeight {
        horizontalLadders[horizontalLaddersIndex] = makeOneHorizontalLadders(Values: changValues[horizontalLaddersIndex], ladders: horizontalLadders[horizontalLaddersIndex])
    }
    return horizontalLadders
}


//사다리의 1가로줄을 만드는 함수
func makeOneHorizontalLadders (Values: [Bool],ladders: [String]) -> [String] {
    var existingValues = Values
    var changeladders = ladders
    for index in 0..<existingValues.count {
        changeladders[index] = changeValue(targetValues: existingValues, changeTargetIndex: index)
    }
    return changeladders
}


//Bool값을 사다리모양으로 바꾸는 함수
func changeValue (targetValues: [Bool],changeTargetIndex: Int)->String {
    var changeTarget = targetValues
    
    if changeTarget[changeTargetIndex] == true {
        return "-"
    }
    return " "
}





//배열에있는 그림으로 사다리1행 만드는 함수
func makeLadderOneLine (lineCount : Int, ladderValues : [[String]]) {
    let ladderWidth = ladderValues[0].count
    
    var verticalLine = "|"
    for oneLineladderCount in 0..<ladderWidth {
        verticalLine = verticalLine + ladderValues[lineCount][oneLineladderCount]
        verticalLine = verticalLine + "|"
    }
    print(verticalLine)
    verticalLine = " "
}


//사다리높이만큼 사다리그림을 1행씩 증가시키는 함수
func increaseByladderLine (ladders: [[String]]) {
    let ladderHeight = ladders.count
    
    for ladderHeightCount in 0..<ladderHeight {
        makeLadderOneLine(lineCount: ladderHeightCount, ladderValues: ladders)
    }
}

//게임 실행하는 함수
func playGame() {
    let (peopleNum, ladderNum) = inputUserPeopleAndLadderCounts()
    let values = hasHorizontalValues(peopleNum: peopleNum, ladderNum: ladderNum)
    let ladders = horizontalValuesChangeHorizontalLadders(changValues: values)
    increaseByladderLine(ladders: ladders)
}

playGame()
