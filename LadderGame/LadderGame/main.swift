//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

//--- 입력부 --------------------------------------

//값을 입력받음
func receiveParticipants() -> String? {
    print("참여할 사람은 몇 명입니까?")
    let columnString = readLine()
    return columnString
}

// 사다리 높이 입력
func receiveStairs() -> String? {
    print("사다리의 크기는 몇층인가요?")
    let rowString = readLine()
    return rowString
}

//-- 검사부 ----------------------------------------

//값이 유효한지 검사. 유효하지 않으면 0을 반환
func checkNumericInput(optionalColumnString: String?, optionalRowString: String?) -> (columnNumber: UInt, rowNumber: UInt) {
    guard let columnString = optionalColumnString, let rowString = optionalRowString else {
        return(0,0)
    }
    if let columnNumber = UInt(columnString), let rowNumber = UInt(rowString) {
        return (columnNumber, rowNumber)
    }
    return (0,0)
}

//0을 반환 받았을 때 경고문 출력 및 프로그램 중지
func checkWrongInput(checkedInput: (columnNumber: UInt,rowNumber: UInt)) -> String {
    if checkedInput.columnNumber == 0 || checkedInput.rowNumber == 0 {
        print("입력값이 잘못되었습니다.(2이상의 정수만 가능)")
        return "wrong"
    }
    return "right"
}

//-- 데이터 생성부 -------------------------------------

//가로 줄 랜덤 결정
func setLadderStair() -> String {
    let bar = arc4random_uniform(2)
    if bar == 1 {
        return "—"
    } else {
        return " "
    }
}

//가로 줄 배열 생성
func createRowLine(columnNumber: UInt) -> [String] {
    var rowLine: [String] = Array()
    rowLine.append("")
    for _ in 0..<columnNumber-1 {
        rowLine.append(setLadderStair())
    }
    rowLine.append("")
    return rowLine
}

//전체 2중 배열 생성
func createWholeLadderLines(columnNumber: UInt, rowNumber: UInt) -> [[String]] {
    var ladder: [[String]] = Array()
    for _ in 0..<rowNumber {
        let oneStair: [String] = createRowLine(columnNumber: columnNumber)
        ladder.append(oneStair)
    }
    return ladder
}

//참가자 번호 생성
func makeParticipant(columnNumber: Int) -> [String] {
    var participants = Array<String>()
    for i in 1...columnNumber {
        participants.append(String(i))
    }
    return participants
}

//꽝 생성
func makeLosingTicket(columnNumber: Int) -> [String] {
    var gameResults: [String] = Array.init(repeating: " ", count: columnNumber)
    let losingPoint = arc4random_uniform(UInt32(columnNumber))
    gameResults[Int(losingPoint)] = "X"
    return gameResults
}

//-- 출력부 ---------------------------------------

//완성된 사다리를 출력
func printCompletedLadder (wholeLadderLines: [[String]]) -> Void {
    for rowNumber in 0..<wholeLadderLines.count {
        print(wholeLadderLines[rowNumber].joined(separator: "|"))
    }
}

//참가자, 완성된 사다리, 꽝을 출력
func printLadderGame(wholeLadderLines: [[String]], columnNumber: UInt) ->Void {
    let participants = makeParticipant(columnNumber: Int(columnNumber))
    let gameResults = makeLosingTicket(columnNumber: Int(columnNumber))
    print(participants.joined(separator: " "))
    printCompletedLadder(wholeLadderLines: wholeLadderLines)
    print(gameResults.joined(separator: " "))
}

//--- 구동부 ---------------------------------------

//메인함수
func main() {
    let columnString = receiveParticipants()
    let rowString = receiveStairs()
    let checkedInput = checkNumericInput(optionalColumnString: columnString, optionalRowString: rowString)
    if checkWrongInput(checkedInput: checkedInput) == "wrong" {return}
    let wholeLadderLines = createWholeLadderLines(columnNumber: checkedInput.columnNumber, rowNumber: checkedInput.rowNumber)
    printLadderGame(wholeLadderLines: wholeLadderLines, columnNumber: checkedInput.columnNumber)
}


main()



