//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

// 0. 입력값을 받는 함수
func getUserInput( ) -> (participant: Int, ladder: Int) {
    print("참여할 사람은 몇 명 인가요?")
    guard let numberOfPeople = readLine(), let participant = Int(numberOfPeople) else { return (0,0) }
    print("사다리 높이는 몇 개인가요?")
    guard let countOfLadder = readLine(), let ladder = Int(countOfLadder) else {  return (0,0) }
    return (participant, ladder)
}

// 1. 랜덤 불값 생성
func makeRandomBooleanValue () -> Bool {
    let randomNum = Int(arc4random_uniform(2))
    guard randomNum % 2 == 0 else { return false }
    return true
}

// 2. 랜덤 불값의 한줄 배열 만들기
func makeRandomInnerArray (numberOfPeople col: Int) -> Array<Bool> {
    var firstArray = Array<Bool>()
    for _ in 0 ..< col-1 {
        firstArray.append(makeRandomBooleanValue())
    }
    return firstArray
}

// 3. 불값에 맞는 스트링을 변환하여 사다리 한줄 프린트
func printOneLine (_ col: Int) -> String {
    var result = String()
    var inputArray = makeRandomInnerArray(numberOfPeople: col)
    for inner in 0 ..< inputArray.count {
        if inputArray[inner] == true {
            result += "-"
        } else {
            result += " "
        }
        result += "|"
    }
    return result
}

// 4. 사다리 전체 출력
func printFullLadder (colOf: Int, rowOf: Int) {
    for _ in 0 ..< colOf {
        print ("|", terminator: printOneLine(rowOf))
        print ()
    }
}

// 5. 프로그램 루프
ladderLoop : while (true) {
    let (participant, ladder) = getUserInput()
    guard String(participant) != "\n" && ladder != 0 else {
        break
    }
    printFullLadder(colOf: ladder, rowOf: participant)
}
