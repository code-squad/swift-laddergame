//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

//값을 입력받음
func receiveInput() -> (columnString: String, rowString: String) {
    print("참여할 사람은 몇 명입니까?")
    let optionalColumnString = readLine()
    print("사다리 높이는 몇 층인가요?")
    let optionalRowString = readLine()
    if let columnString = optionalColumnString, let rowString = optionalRowString {
        return (columnString, rowString)
    }
    return ("nil", "nil")
}

//값이 유효한지 검사. 유효하지 않으면 0을 반환
func checkInputValue(columnString: String, rowString: String) -> (columnNumber: UInt, rowNumber: UInt) {
    if let columnNumber = UInt(columnString), let rowNumber = UInt(rowString) {
        return (columnNumber, rowNumber)
    }
    return (0,0)
}

//0을 반환 받았을 때 경고문 출력
func preventWrongInput(checkedInput: (columnNumber: UInt,rowNumber: UInt)) -> Void {
    if checkedInput.columnNumber == 0 || checkedInput.rowNumber == 0 {
        print("입력값이 잘못되었습니다.(1이상의 정수만 가능)")
    }
}

//세로 줄 그리는 배열 생성
func createVerticalLines(rowNumber: UInt) -> [String] {
    let VerticalLine = Array(repeating: "|", count: Int(rowNumber))
    return VerticalLine
}

//가로 줄 랜덤 결정
func SetBarOrNil() -> String {
    let bar = arc4random_uniform(2)
    if bar == 1 {
        return "—"
    } else {
        return " "
    }
}


//가로 줄 그리는 배열 생성
func createHorizontalLines(rowNumber: UInt) -> [String] {
    var horizontalLine: [String] = Array()
    for _ in 0..<rowNumber {
        horizontalLine.append(SetBarOrNil())
    }
    return horizontalLine
}

//전체 배열이 홀수,짝수인지 판단하여 부분 배열 반환
func checkLinesOddEven(ladderIndex: UInt, columnNumber: UInt, rowNumber: UInt) -> [String] {
    if ladderIndex % 2 == 1 {
        return createVerticalLines(rowNumber: rowNumber)
    } else {
        return createHorizontalLines(rowNumber: rowNumber)
    }
}

//전체 배열 조립
func createWholeLadderKit(columnNumber: UInt, rowNumber: UInt) -> [[String]] {
    var ladder: [[String]] = Array()
    for i in 0..<columnNumber*2-1 {
        let partialArray: [String] = checkLinesOddEven(ladderIndex: i+1, columnNumber: columnNumber, rowNumber: rowNumber)
        ladder.append(partialArray)
    }
    return ladder
}

//이중 배열을 1열씩 부분문자열 생성
func assembleALineOfLadder(indexOfInnerArray: Int, ladderStr: String, wholeLadderKit: [[String]]) -> String {
    var ladder: String = ladderStr
    for i in 0..<wholeLadderKit.count {
        ladder += "\(wholeLadderKit[i][indexOfInnerArray])"
    }
    ladder = "\(ladder)\n"
    return ladder
}

//각 부분 문자열을 큰 문자열로 조립
func assembleWholeLadder(wholeLadderKit: [[String]]) -> String {
    var ladder: String = ""
    for i in 0..<wholeLadderKit[0].count {
        ladder = assembleALineOfLadder(indexOfInnerArray: i, ladderStr: ladder, wholeLadderKit: wholeLadderKit)
    }
    return ladder
}

//참가자 번호 생성
func makeParticipant(columnNumber: Int) -> [String] {
    var participants: [String] = Array.init(repeating: " ", count: columnNumber*2-1)
    var i = 0
    var j = 1
    while i < columnNumber*2-1 {
        participants[i] = String(j)
        j += 1
        i += 2
        
    }
    return participants
}

//꽝 생성
func makeLosingTicket(columnNumber: Int) -> [String] {
    var gameResults: [String] = Array.init(repeating: " ", count: columnNumber*2-1)
    let losingPoint = arc4random_uniform(UInt32(columnNumber))*2
    gameResults[Int(losingPoint)] = "X"
    return gameResults
}

//참가자, 완성된 사다리, 꽝을 출력
func printGame(completedLadder: String, makeParticipant: [String], makeLosingTiket: [String]) ->Void {
    print(makeParticipant.joined(separator: ""))
    print(completedLadder)
    print(makeLosingTiket.joined(separator: ""))
}


//메인함수
func main(inputValue: (columnString: String,rowString: String)) -> Void {
    let checkedInput = checkInputValue(columnString: inputValue.columnString, rowString: inputValue.rowString)
    preventWrongInput(checkedInput: checkedInput)
    let wholeLadderKit = createWholeLadderKit(columnNumber: checkedInput.columnNumber, rowNumber: checkedInput.rowNumber)
    let completedLadder = assembleWholeLadder(wholeLadderKit: wholeLadderKit)
    let participants = makeParticipant(columnNumber: Int(checkedInput.columnNumber))
    let gameResults = makeLosingTicket(columnNumber: Int(checkedInput.columnNumber))
    printGame(completedLadder: completedLadder, makeParticipant: participants, makeLosingTiket: gameResults)
}

main(inputValue: receiveInput())
