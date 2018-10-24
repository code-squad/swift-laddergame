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

/// << Input >>
// 사용자로부터 받은 표준입력 Optional(String) -> Int로 변환해주는 함수
func convertOptionalStringToInteger() -> Int {
    guard let userInformation = readLine() else {
        return 0
    }
    guard let realUserInformation = Int(userInformation) else {
        return 0
    }
    return realUserInformation
}
// 사용자 입력을 저장하는 함수
func storeUserData() -> (personNum: Int, ladderHeight: Int) {
    var personNum = 0
    var ladderHeight = 0
    print("참여할 사람은 몇 명 인가요?")
    personNum = convertOptionalStringToInteger()
    print("최대 사다리 높이는 몇 개 인가요?")
    ladderHeight = convertOptionalStringToInteger()
    return (personNum, ladderHeight)
}

/// Process(수정) ->  사다리 발판정보를 저장하기위한 데이터구조와 출력을 위한 데이터구조 반영
/// 1. 사다리 발판 정보를 저장하기 위한 데이터구조
///     1) 사다리 발판 정보를 저장하기 위한 데이터구조 2차원배열
///     2) 인덱스가 홀수일 경우(1,3,5,7,...) 랜덤으로 발판("-")을 생성한다.
/// 2. 출력을 위한 데이터구조
///     1) 사다리 발판 정보를 저장한 2차원 배열을 이용한다.
///     2) 인덱스가 짝수 일 경우(0,2,4,6,...)
///         - 사다리의 세로 막대("|")을 넣어준다.
///     3) 인덱스가 홀수 일 경우(1,3,5,7,...)
///         - 발판("-")정보가 있는지 확인하고 없으면 빈문자열(" ")을 넣어준다.

//// 사다리의 발판 정보를 저장하는 함수들
// 1) 비어있는 1차원 사다리구조 생성
func makeBlankOneOrderLadder(using person: Int) -> [String] {
    return Array(repeating: "", count: person*2-1)
}
// 2) 비어있는 2차원 사다리구조 생성
func makeBlankTwoOrderLadder(oneOrderLadder: [String], ladderHeight: Int) -> [[String]] {
    return Array(repeating: oneOrderLadder, count: ladderHeight)
}
// 3) 1차원 사다리발판 구조를 생성하는 함수
func makeOneOrderLadderLegStructure(using blankOneOrderLadder: [String]) -> [String] {
    var result = blankOneOrderLadder
    for index in 0..<blankOneOrderLadder.count {
        var judgeEvenOrOdd: Bool = selectEvenOrOdd(index)
        var judgePerform: Bool = judgeMakeLadderLeg(judgeEvenOrOdd)
        var judgeMakeLeg: Bool = getRandomValue((index+1)*100, judgePerform) == true ? true : false
        result[index] = performLadderLeg(judgeMakeLeg)
        if result[index] == "-" {break}
    }
    return result
}
// 4) 2차원 사다리발판 구조를 생성하는 함수
func makeTwoOrderLadderLegStructure(blankOneOrderLadder: [String], blankTwoOrderLadder: [[String]]) -> [[String]] {
    var result = blankTwoOrderLadder
    for index in 0..<blankTwoOrderLadder.count {
        result[index] = makeOneOrderLadderLegStructure(using: blankOneOrderLadder)
    }
    return result
}
// 5) 인덱스가 짝수이면 true 홀수이면 false를 반환하는 함수
func selectEvenOrOdd(_ num: Int) -> Bool {
    return num % 2 == 0 ? true : false
}
// 6) 입력값의 여부(짝수인지 홀수인지에 따라 Bool값을 반환)에 따라 사다리의 발판을 생성하는 함수
func performLadderLeg(_ judge: Bool) -> String {
    return judge == true ? "-" : ""
}
// 7) 사다리 발판을 생성여부를 판단하는 함수
func judgeMakeLadderLeg(_ even: Bool) -> Bool {
    return even == true ? true : false
}
// 8) 랜덤값을 2로 나눈 나머지가 0이면 true, 1이면 false를 반환
func getRandomValue(_ num: Int, _ judegement: Bool) -> Bool {
    switch judegement {
    case true:
        return false
    case false:
        return Int(arc4random_uniform(UInt32(num))) % 2 == 0 ? true : false
    }
}

/// 사다리 발판 정보를 토대로 완성된 사다리구조 만들기
// 완성된 사다리구조 만들기
func completedLadderStructure(_ ladderLegStructure: [[String]]) -> [[String]] {
    var completedLadderStructure = ladderLegStructure
    return performLoopTwoOrderLadder(completedLadderStructure)
}
// 2차원 사다리에서 1차원 사다리로 접근하는 함수
func performLoopTwoOrderLadder(_ twoOrderLadder: [[String]]) -> [[String]] {
    var result = twoOrderLadder
    for index in 0..<twoOrderLadder.count {
        var oneOrderLadder = twoOrderLadder[index]
        result[index] = accessElementOfOneOrderLadder(oneOrderLadder)
    }
    return result
}
// 1차원 사다리의 개별 요소에 접근하는 함수
func accessElementOfOneOrderLadder(_ oneOrderLadder: [String]) -> [String] {
    var result = oneOrderLadder
    for index in 0..<oneOrderLadder.count {
        result[index] = insertLadderString(result, index)
    }
    return result
}
// 사다리의 "|"와 " " 문자열 삽입
func insertLadderString(_ oneOrderLadder: [String], _ index: Int) -> String {
    switch index % 2 == 0 {
    case true:
        return "|"
    case false where oneOrderLadder[index].isEmpty == true:
        return " "
    default:
        return oneOrderLadder[index]
    }
}
/// Output
/// 완성된 사다리를 출력하는 함수

// output two order ladder structure at console
func printLadder(_ completedLadderStructure: [[String]]) {
    for i in 0..<completedLadderStructure.count {
        print(completedLadderStructure[i].joined())
    }
}

// main function
func main() {
    let userInformation = storeUserData()
    let personNumber = userInformation.personNum
    let ladderHeight = userInformation.ladderHeight
    let blankOneOrderLadder = makeBlankOneOrderLadder(using: personNumber)
    let blankTwoOrderLadder = makeBlankTwoOrderLadder(oneOrderLadder: blankOneOrderLadder, ladderHeight: ladderHeight)
    let ladderLegStructure = makeTwoOrderLadderLegStructure(blankOneOrderLadder: blankOneOrderLadder, blankTwoOrderLadder: blankTwoOrderLadder)
    let completedLadder = completedLadderStructure(ladderLegStructure)
    printLadder(completedLadder)
}

// call main function
main()
