//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//
//  Modified by Jamie.

// ------------ 방안 1 ------------> 문제점: 무조건 뒷 스텝이 false가 되어 사다리 모양 다양성 저하
// 이전 스텝과 현재 스텝이 모두 true일 때(사다리 행이 연결되어있을 때), 현재 스텝 false로 리턴
func removeConnectionOf1(previousStep:Bool, presentStep:Bool) -> Bool {
    if (previousStep && presentStep) {
        return false
    }
    return presentStep
}
// 만들어진 행의 요소를 돌면서, 연결된 행을 검사 및 삭제해주는 removeConnectionOf() 호출
func checkConnectionOf1(_ ladderSteps:[Bool]) -> [Bool] {
    var ladderSteps = ladderSteps
    for index in 1...ladderSteps.count-1 {
        ladderSteps[index] = removeConnectionOf1(previousStep: ladderSteps[index-1], presentStep: ladderSteps[index])
    }
    return ladderSteps
}
// ------------ 방안 2 ------------> 문제점: for문과 if문을 분리한 것의 효용성 사라짐
//이전 스텝과 현재 스텝이 모두 true일 때(사다리 행이 연결되어있을 때), 둘 중 랜덤하게 false로 리턴
func removeConnectionOf2(_ previousAndPresentSteps:[Bool]) -> [Bool] {
    var twoSteps = previousAndPresentSteps
    if (twoSteps[0] && twoSteps[1]) {
        twoSteps[Int.random(in: 0...1)] = false
    }
    return twoSteps
}
// 만들어진 행의 요소를 돌면서, 연결된 행을 검사 및 삭제해주는 removeConnectionOf() 호출
func checkConnectionOf2(_ ladderSteps:[Bool]) -> [Bool] {
    var ladderSteps = ladderSteps
    for index in 1...ladderSteps.count-1 {
        // 아래의 코드가 매번 실행되어서 for문과 if문을 분리한 것의 효용성 사라짐
        ladderSteps[index-1] = removeConnectionOf2([ladderSteps[index-1],ladderSteps[index]])[0]
        ladderSteps[index] = removeConnectionOf2([ladderSteps[index-1],ladderSteps[index]])[1]
    }
    return ladderSteps
}
// ------------ 위 방안에 대한 현재 함수 ------------> 문제점: 인덴트가 2
// ------------> 그래도 사용한 이유 : 인덴트를 줄임으로서 얻는 효과보다 함수를 분리하면서 생기는 문제점이 크다고 판단
func removeConnectionOf(_ ladderSteps:[Bool]) -> [Bool] {
    var ladderSteps = ladderSteps
    for index in 1...ladderSteps.count-1 {
        if (ladderSteps[index-1] && ladderSteps[index]) {
            ladderSteps[index-Int.random(in: 0...1)] = false
        }
    }
    return ladderSteps
}

// 사다리의 열 하나를 랜덤으로 만들고, 연결된 행이 있는지 검사 후 [Bool] 리턴
func makeLadderRow(rowIndex:Int) -> [Bool] {
    var ladderSteps : [Bool] = Array(repeating: false, count: rowIndex)
    for index in ladderSteps.indices {
        ladderSteps[index] = Bool.random()
    }
    ladderSteps = removeConnectionOf(ladderSteps)
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
func printSingle(column:Bool) {
    if(column==true) {
        print("-", terminator: "|")
        return
    }
    print(" ", terminator: "|")
}

// 위 printSingle(column)으로 만든 행으로 하나의 열을 완성
func printSingle(row:[Bool]) {
    for column in row {
        printSingle(column:column)
    }
}

// 위 printSingle(row)으로 만든 열로 사다리 완성
func printLadders(_ ladders:[[Bool]]) {
    for row in ladders {
        print("", terminator: "|")
        printSingle(row:row)
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
