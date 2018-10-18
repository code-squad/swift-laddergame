//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

/** << 요구사항 >>
 1. 간단한 사다리 게임을 구현한다.
 2. n개의 사람과 m개의 사다리 개수를 입력할 수 있어야 한다.
 3. 사다리는 랜덤으로 있거나 없을 수도 있다.
 4. 사다리가 있으면 -를 표시하고 없으면 " " 빈공백을 표시한다. 양옆에는 |로 세로를 표시한다.
 5. 사다리 상태를 화면에 출력한다. 어느 시점에 출력할 것인지에 대한 제약은 없다.
 6. struct 작성하지 않고 함수만으로 구현해본다.
 **/

/// << Input >>
/// 1) 사람수를 입력받는 함수
func getInputPersonNum() -> Int {
    print("참여할 사람은 몇 명 인가요?")
    let personNum = readLine()!
    guard let person = Int(personNum) else {
        return 0
    }
    return person
}
/// 2) 사다리높이 입력받는 함수
func getInputLadderHeight() -> Int {
    print("최대 사다리 높이는 몇 개 인가요?")
    let ladderHeight = readLine()!
    guard let height = Int(ladderHeight) else {
        return 0
    }
    return height
}

/// Process
/// 1) 사다리 생성 함수
///     - (1) 빈 1차원 배열 생성
///     - (2) 1차원 배열에 비어있는 사다리 생성 인덱스가 홀수이면 "|", 짝수이면 " "를 넣어준다.
///     - (3) 1차원 배열의 빈 공간에 랜덤으로 "-"를 넣어준다.
///     - (4) 2차원 배열에 높이의 수만큼 1차원 배열을 넣어준다.

// Make blank string one order array
func makeLineArray(_ person: Int) -> [String] {
    return Array(repeating: "", count: (person*2 - 1))
}
// put vertical poll(="|") in blank string one order array
func putVerticalPoll(_ lineArray: [String]) -> [String] {
    var result: [String] = [String]()
    for i in 0..<lineArray.count {
        if i % 2 == 0 {
            result.append("|")
        } else {
            result.append(" ")
        }
    }
    return result
}
// put random horizon poll(="-") in ladder one order array
func putHorizonPoll(_ lineArray: [String]) -> [String] {
    var result: [String] = lineArray
    for i in 0..<lineArray.count {
        if i % 2 != 0 {
            if arc4random_uniform(3) % 2 == 0 {
                result[i] = "-"
            }
        }
    }
    return result
}
// make two order ladder array
func makeTwoArrayLadder(_ person: Int, _ height: Int) -> [[String]] {
    var ladderTwoArray = [[String]]()
    for i in 1...height {
        ladderTwoArray.append(putHorizonPoll(putVerticalPoll(makeLineArray(person))))
    }
    return ladderTwoArray
}
/// Output
/// 2차원 배열 결과로 생성된 사다리를 출력하는 함수
// output two order ladder array at console
func printLadder(_ ladderTwoArray: [[String]]) {
    for i in 0..<ladderTwoArray.count {
        print(ladderTwoArray[i].joined())
    }
}

// main function
func main() {
    let personNumber = getInputPersonNum()
    let ladderHeight = getInputLadderHeight()
    let ladder = makeTwoArrayLadder(personNumber, ladderHeight)
    printLadder(ladder)
}

// call main function
main()



