//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation


// 랜덤 불값 생성
func makeRandomBooleanValue () -> Bool {
    let randomNum = Int(arc4random_uniform(10))
    guard randomNum % 2 == 0 else { return false }
    return true
}

// <랜덤 불값의 한줄 배열 만들기>
func makeRandomInnerArray (numberOfPeople col: Int) -> Array<Bool> {
    var firstArray = Array<Bool>()
    for _ in 0 ..< col-1 {
        firstArray.append(makeRandomBooleanValue())
    }
    return firstArray
}

// <랜덤 불값의 전체 배열 만들기>
func makeTwoDimentionofBool (numberOf col : Int, countOf row: Int) -> Array<Array<Bool>> {
    var result = Array<Array<Bool>>()
    for _ in 0 ..< row {
        result.append(makeRandomInnerArray(numberOfPeople: col))
    }
    return result
}

// 프린트 함수
func printLadder (_ input: Array<Array<Bool>>) {
    for outer in 0 ..< input.count {
        for inner in 0 ..< input[outer].count {
            if input[outer][inner] == true {
                print("|", terminator: "-")
            } else {
                print("|", terminator: " ")
            }
        }
        print ("|")
    }
}

// 프로그램 루프
ladderLoop : while (true) {
    print("참여할 사람은 몇 명 인가요?")
    guard let numberOfPeople = readLine(), let participant = Int(numberOfPeople) else {break}
    print("최대 사다리 높이는 몇 개인가요?")
    guard let countOfLadder = readLine(), let ladder = Int(countOfLadder) else {break}
    printLadder(makeTwoDimentionofBool(numberOf: participant, countOf: ladder))
}

