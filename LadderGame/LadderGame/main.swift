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

/// Output Set
// make one line ladder structure
func makeOneLineLadder(using personNum: Int) -> String {
    var oneLineLadder = "|"
    let randomLadderLeg = getRandomLadderLeg(using: personNum)
    let completeLadderLegStruct = checkAsssociatedTrue(using: randomLadderLeg)
    for item in completeLadderLegStruct {
        oneLineLadder += item == true ? "-" + "|" : " " + "|"
    }
    return oneLineLadder
}
// print whole ladder structure
func printLadderLines(using ladderHeight: Int, and personNum: Int) {
    for _ in 1...ladderHeight {
        print(makeOneLineLadder(using: personNum))
    }
}
// get random bool value
func getRandomBool() -> Bool {
    return arc4random_uniform(2) == 0 ? true : false
}
func getRandomLadderLeg(using personNum: Int) -> [Bool] {
    let boolCount = personNum - 1
    var boolSet: [Bool] = [Bool]()
    for _ in 1...boolCount {
        boolSet.append(getRandomBool())
    }
    return boolSet
}

func checkAsssociatedTrue(using boolSet: [Bool]) -> [Bool] {
    var resultBoolSet = boolSet
    for index in 0..<resultBoolSet.count-1 {
        if resultBoolSet[index] == true {
            resultBoolSet[index+1] = false
        }
    }
    return resultBoolSet
}

/// main function
func main() {
    let userData = storeUserData()
    let personNum = userData.personNum
    let ladderHeight = userData.ladderHeight
    let ladderLines = printLadderLines(using: ladderHeight, and: personNum)
}
/// call main function
main()
