//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//
//  Modified by Jamie.

// 사다리 연속 생성을 제어해주면서 랜덤으로 Boolean 리턴
func getRandomBool(index:Int, ladderSteps:[Bool]) -> Bool {
    guard !(index > 0 && ladderSteps[index-1]) else { return false }
    return Bool.random()
}

// 사다리의 열 하나를 만들어 [Bool] 리턴
func makeLadderRow(rowIndex:Int) -> [Bool] {
    var ladderSteps : [Bool] = Array(repeating: false, count: rowIndex)
    for index in ladderSteps.indices {
        ladderSteps[index] = getRandomBool(index: index, ladderSteps: ladderSteps)
    }
    return ladderSteps
}

// makeLadderRow()으로 만든 열을 쌓아 사다리배열 [[Bool]] 리턴
func makeLadders(_ maxHeight:Int, _ numberOfPeople:Int) -> [[Bool]] {
    var ladders : [[Bool]] = []
    for _ in 1...maxHeight {
        ladders.append(makeLadderRow(rowIndex: (numberOfPeople-1)))
    }
    return ladders
}

// 하나의 행을 출력 (true: "-|" false: " |")
func printSingleColumn(column:Bool) {
    guard !(column) else {
        print("-", terminator: "|")
        return
    }
    print(" ", terminator: "|")
}

// 위 printSingleColumn()으로 만든 행으로 하나의 열을 완성
func printSingleRow(row:[Bool]) {
    for column in row {
        printSingleColumn(column: column)
    }
}

// 위 printSingleRow()으로 만든 열로 사다리 완성
func printLadders(_ ladders:[[Bool]]) {
    for row in ladders {
        print("", terminator: "|")
        printSingleRow(row: row)
        print("")
    }
}

// 안내메세지를 출력하고 받아온 입력값을 문자열로 리턴
func getInput(guideMessage:String) -> String {
    print(guideMessage)
    guard let input:String = readLine() else { return String() }
    return input
}

// 두 입력값이 정수형일 경우에만 makeLadder()로 리턴받은 [[Bool]]을 printLadder()로 출력 실행
func execute() {
    var input = getInput(guideMessage: "참여할 사람은 몇 명 인가요?")
    guard let numberOfPeople:Int = Int(input) else { return }
    input = getInput(guideMessage: "최대 사다리 높이는 몇 개인가요?")
    guard let maxHeight:Int = Int(input) else { return }
    let ladders = makeLadders(maxHeight, numberOfPeople)
    printLadders(ladders)
}

// 실행
execute()
