//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

// Swift-LadderGame

// 입력받는 함수
func getInput() -> Int {
    let element = readLine()
    return checkType(input: element)
}

// 입력받은 값이 상수인지 확인하는 함수
func checkType(input: String?) -> Int {
    guard input == nil || (input?.isEmpty ?? false) else {
        return Int(input!) ?? 0
    }
    
    return Int(input!) ?? 0
}

// 사다리 게임에 참여할 사람, 최대 사다리 높이를 입력받고 확인하는 함수
func getElements() -> (Int, Int) {
    var elements = (people: Int(), height: Int())
    
    print("참여할 사람은 몇 명인가요?")
    elements.people = getInput()
    
    print("최대 사다리 높이는 몇 개인가요?")
    elements.height = getInput()
    
    return elements
}



// 중복을 바꿔주는 함수
func changeLegToEmpty(before: String, after: String) -> String {
    var result = after
    
    if before == "-" && after == "-" {
        result = " "
    }

    return result
}

// 사다리가 옆으로 연속해서 나오는 걸 방지하는 함수
func preventOverlap(legs: [String]) -> [String] {
    var refined = legs
    
    for i in 0..<(refined.count-1) {
        refined[i+1] = changeLegToEmpty(before: refined[i], after: refined[i+1])
    }
    
    return refined
}

// 사다리가 옆으로 연속해서 나오지 검증하는 함수
// 연속해서 나올 가능성이 있을/없을 경우로 분리
func checkSuccession(line: [String]) -> [String] {
    if line.count > 1 {
        let preventedLegs = preventOverlap(legs: line)
        return preventedLegs
    }
    
    return line
}

// 한 계단을 만드는 함수
func makeOneStepAlong(number: Int) -> [String] {
    let legs = ["-", " "]
    var step = [String]()
    
    for _ in 1..<number {
        step.append(legs[Int(arc4random_uniform(2))])
    }

    let checkedStep = checkSuccession(line: step)
    return checkedStep
}

// 사다리를 만드는 함수
func buildLadderWith(elements: (Int, Int)) -> [[String]] {
    let people = elements.0, height = elements.1
    var steps = Array(repeating: [String](), count: height)
    
    for i in 0..<height {
        steps[i] = makeOneStepAlong(number: people)
    }
    
    return steps
}



// 사다리 중 한 계단을 출력하는 함수
func printOneStepUsing(_ leg: String) {
    print("|\(leg)|")
}

// 사다리를 출력하는 함수
func printOut(_ ladder: [[String]]) {
    for step in ladder {
        let leg = step.joined(separator: "|")
        printOneStepUsing(leg)
    }
}



// 메인 함수
func main() {
    let peopleAndHeight = getElements()
    let ladder = buildLadderWith(elements: peopleAndHeight)
    printOut(ladder)
}

main()
