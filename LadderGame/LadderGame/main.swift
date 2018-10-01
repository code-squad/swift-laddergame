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
func receiveParticipants() -> String {
    print("참여할 사람은 몇 명입니까?")
    let columnString = readLine() ?? ""
    return columnString
}

// 사다리 높이 입력
func receiveStairs() -> String {
    print("사다리의 크기는 몇층인가요?")
    let rowString = readLine() ?? ""
    return rowString
}


//-- 검사부 ----------------------------------------

//값이 정상적으로 입력되었는지 검사, 숫자가 아닌 값이 들어오면 0,0을 반환
func checkNumericInput(columnString: String, rowString: String) -> (columnNumber: Int, rowNumber: Int) {
    let columnNumber = Int(columnString) ?? 0
    let rowNumber = Int(rowString) ?? 0
    return (columnNumber, rowNumber)
}

//0을 반환 받았을 때(값이 비정상일때) 프로그램 중지 신호 반환
func checkWrongInput(checkedInput: (columnNumber: Int,rowNumber: Int)) -> Bool {
    return checkedInput.columnNumber == 0 || checkedInput.rowNumber == 0
}


//-- 데이터 생성부 -------------------------------------

//가로 줄 랜덤 결정
func setLadderStair() -> String {
    let bar = arc4random_uniform(2)
    if bar == 1 {
        return "—"
    }
    return " "
}

//가로 줄 배열 생성
func createRowLine(columnNumber: Int) -> [String] {
    var rowLine: [String] = Array()
    rowLine.append("")
    for i in 1..<columnNumber {
        rowLine.append(checkPriorStair(latestStair: rowLine[i-1]))
    }
    rowLine.append("")
    return rowLine
}

//이전 요소에 -가 있으면 공백을, 없으면 랜덤을 생성
func checkPriorStair(latestStair: String) -> String {
    if latestStair == "—" {
        return " "
    }
    return setLadderStair()
}


//전체 2중 배열 생성
func createWholeLadderLines(columnNumber: Int, rowNumber: Int) -> [[String]] {
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
    for participant in 1...columnNumber {
        participants.append(String(participant))
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

// 입력값이 오류일 때 메세지 출력
    func printErrorMessage() {
        print("입력값이 잘못되었습니다.(2이상의 정수만 가능)")
    }
    
//완성된 사다리를 생성
func printCompletedLadder (wholeLadderLines: [[String]]) -> Void {
    for rowNumber in 0..<wholeLadderLines.count {
        print(wholeLadderLines[rowNumber].joined(separator: "|"))
    }
}

//완성된 게임을 출력 (참가자, 완성된 사다리, 꽝)
func printLadderGame(wholeLadderLines: [[String]], columnNumber: Int) -> Void {
    let participants = makeParticipant(columnNumber: Int(columnNumber))
    let gameResults = makeLosingTicket(columnNumber: Int(columnNumber))
    print(participants.joined(separator: " "))
    printCompletedLadder(wholeLadderLines: wholeLadderLines)
    print(gameResults.joined(separator: " "))
}

//--- 구동부 -------------------------------------------------

//메인함수
func main() {
    let columnString = receiveParticipants()
    let rowString = receiveStairs()
    let checkedInput = checkNumericInput(columnString: columnString, rowString: rowString)
    if checkWrongInput(checkedInput: checkedInput) {
        printErrorMessage()
        return
    }
    let wholeLadderLines = createWholeLadderLines(columnNumber: checkedInput.columnNumber, rowNumber: checkedInput.rowNumber)
    printLadderGame(wholeLadderLines: wholeLadderLines, columnNumber: checkedInput.columnNumber)
}


main()
