//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation
/// << LadderGame Step_2 >> ///
/** << 요구사항 >>
 1. 기존 코드를 모두 삭제하고 처음부터 다시 구현을 시작하거나, 이전 단계 사다리게임 요구사항을 구현한 상태에서 시작한다.
 2. 사다리가 옆으로 연속해서 |-|-| 나오지 않도록 검증한다.
 3. indent(인덴트, 들여쓰기) depth를 2단계에서 1단계로 줄여라.
 4. depth의 경우 if문을 사용하는 경우 1단계의 depth가 증가한다. if문 안에 while문을 사용한다면 depth가 2단계가 된다.
 5. else를 사용하지 마라.
 6. 메소드의 크기가 최대 10라인을 넘지 않도록 구현한다.
 7. method가 한 가지 일만 하도록 최대한 작게 만들어라
 **/


/// Input Set
// standard input userData
func inputUserData() -> Int {
    guard let userData = readLine() else {
        return 0
    }
    guard let inputData = Int(userData) else {
        return 0
    }
    return inputData
}
// store userData
func storeUserData() -> (personNum: Int, ladderHeight: Int) {
    var personNum = 0
    var ladderHeight = 0
    print("참여할 사람은 몇 명 인가요?")
    personNum = inputUserData()
    print("최대 사다리 높이는 몇 개 인가요?")
    ladderHeight = inputUserData()
    return (personNum, ladderHeight)
}
// store "-" random index
func makeRandomIndex(using personNum: Int) -> Int {
    let wholeIndex = personNum * 2 - 1
    var random = 0
    while random % 2 == 0 {
        random = Int(arc4random_uniform(UInt32(wholeIndex)))
    }
    return random
}

/// Output Set for print
func printBlank() {
    print(" ", terminator: "")
}
func printLadderLeg() {
    print("|", terminator: "")
}
func printLadderFooter() {
    print("-", terminator: "")
}
func selectPrintFunc(_ index: Int, _ random: Int) {
    if index % 2 == 0 {
        printLadderLeg()
    } else if index == random {
        printLadderFooter()
    } else {
        printBlank()
    }
}
func printLadderOneLine(_ blankOneOrderLadder: [String], _ random: Int) {
    for index in 0..<blankOneOrderLadder.count {
        selectPrintFunc(index, random)
    }
    print("")
}
// print ladderStructure
func printLadderLines(_ oneFloorLadder: [String], _ personNum: Int, _ ladderHeight: Int) {
    let twoFloorLadderStruct = Array(repeating: oneFloorLadder, count: ladderHeight)
    for _ in twoFloorLadderStruct {
        let random = makeRandomIndex(using: personNum)
        printLadderOneLine(oneFloorLadder, random)
    }
}

// main function
func main() {
    let userData = storeUserData()
    let personNum = userData.personNum
    let ladderHeight = userData.ladderHeight
    let blankOneFloorLadder = Array(repeating: "", count: personNum*2 - 1)
    printLadderLines(blankOneFloorLadder, personNum, ladderHeight)
}

// call main function
main()
