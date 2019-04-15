//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

enum LadderComponent: String {
    case empty = " "
    case rung = "-"
    case verticalComponent = "|"
}

enum InputQuestion: String {
    case participantQuestion = "참여할 사람은 몇 명인가요?"
    case ladderHeightQuestion = "최대 사다리 높이는 몇 개인가요?"
}

func ask(question: InputQuestion) -> Int? {
    print(question.rawValue)
    guard let answer = Int(readLine() ?? "0") else { return nil }
    
    return answer
}

///입력 함수
func getUserInput() -> (participantCount: Int, ladderHeight: Int)? {
    guard let participantCount = ask(question: .participantQuestion), participantCount > 1 else { return nil }
    guard let ladderHeight = ask(question: .ladderHeightQuestion), ladderHeight > 0 else { return nil }
    
    return (participantCount, ladderHeight)
}

///사다리 생성 함수
func createLadder(participantCount: Int, ladderHeight: Int) -> [[Bool]] {
    let columnSize = participantCount - 1
    let ladder = Array(repeating: Array(repeating: false, count: columnSize), count: ladderHeight)
    
    return ladder
}

///규칙에 따라 사다리 검증 후 랜덤 값 반환
func randomComponent(row: [Bool], columnNumber: Int) -> Bool {
    if columnNumber == 0 {
        return Bool.random()
    }
    
    //이전 값이 true일 경우 false 반환
    if row[columnNumber - 1] == true {
        return false
    }
    
    return Bool.random()
}

///사다리 행 구성 함수
func configureLadderRow(row: inout [Bool]) {
    for columnNumber in 0..<row.count {
        row[columnNumber] = randomComponent(row: row, columnNumber: columnNumber)
    }
}

///사다리 구성 함수
func configureLadder(_ ladder: inout [[Bool]]) {
    for rowNumber in 0..<ladder.count {
        configureLadderRow(row: &ladder[rowNumber])
    }
}

///true, false에 따라 사다리 부품 구별
func distinguishComponent(columnNumber: Int, columnValue: Bool) -> LadderComponent {
    if columnValue {
        return .rung
    }
    
    return .empty
}

///사다리 행 문자열로 변환
func convertLadderRow(_ row: [Bool]) -> String {
    var rowText = ""
    
    for (columnNumber, columnValue) in row.enumerated() {
        rowText.append(LadderComponent.verticalComponent.rawValue)
        rowText.append(distinguishComponent(columnNumber: columnNumber, columnValue: columnValue).rawValue)
    }
    
    rowText.append(LadderComponent.verticalComponent.rawValue)
    
    return rowText
}

///사다리 출력 함수
func printLadder(_ ladder: [[Bool]]) {
    for row in ladder {
        print(convertLadderRow(row))
    }
}

///시작 함수
func main() {
    guard let userInput = getUserInput() else { return }
    var ladder = createLadder(participantCount: userInput.participantCount, ladderHeight: userInput.ladderHeight)
    configureLadder(&ladder)
    printLadder(ladder)
}

main()
