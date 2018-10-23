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
/// 1) input number of person
func getInputPersonNum() -> Int {
    print("참여할 사람은 몇 명 인가요?")
    guard let personNum = readLine() else {
        return 0
    }
    guard let person = Int(personNum) else {
        return 0
    }
    return person
}
/// 2) input height of ladder
func getInputLadderHeight() -> Int {
    print("최대 사다리 높이는 몇 개 인가요?")
    guard let ladderHeight = readLine() else {
        return 0
    }
    guard let height = Int(ladderHeight) else {
        return 0
    }
    return height
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
// 1) 비어있는 일차원 배열 생성
func makeBlankOneOrderArr(_ person: Int) -> [String] {
    return Array(repeating: "", count: person*2-1)
}
// 2) 비어있는 이차원 배열 생성
func makeBlankTwoOrderArr(_ oneOrderArr: [String], _ ladderHeight: Int) -> [[String]] {
    return Array(repeating: oneOrderArr, count: ladderHeight)
}
// 3) 일차원 배열의 인덱스에 접근하는 함수
func accessOneOrderArray(_ array: [String]) -> [String] {
    var result = array
    for index in 0..<array.count {
        var judgeEvenOrOdd: Bool = selectEvenOrOdd(index)
        var judgePerform: Bool = judgeMakeLadderLeg(judgeEvenOrOdd)
        var judgeMakeLeg: Bool = getRandomValue((index+1)*100, judgePerform) == true ? true : false
        result[index] = performLadderLeg(judgeMakeLeg)
        if result[index] == "-" {
            break
        }
    }
    return result
}
// 4) 이차원 배열의 인덱스에 접근하여 사다리 발판 정보를 저장한다.
func accessTwoOrderArray(_ oneOrderArray: [String], _ twoOrderArray: [[String]]) -> [[String]] {
    var result = twoOrderArray
    for index in 0..<twoOrderArray.count {
        result[index] = accessOneOrderArray(oneOrderArray)
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

//// make two order array for ladder leg information
//func makeLadderLegInformation(_ blankTwoOrderArray: [[String]]) -> [[String]] {
//    var ladderLegInformation = blankTwoOrderArray
//    for i in 0..<blankTwoOrderArray.count {
//        for j in 0..<blankTwoOrderArray[i].count {
//            if j % 2 != 0 {
//                if getRandomValue(j*100) == true {
//                    ladderLegInformation[i][j] = "-"
//                    break   // 최초 한 번만 "-"을 찍으면 break문을 이용해서 루프 탈출
//                }
//            }
//        }
//    }
//    return ladderLegInformation
//}
//
//// make completed ladder structure
//func completedLadderStructure(_ ladderLegStructure: [[String]]) -> [[String]] {
//    var completedLadderStructure = ladderLegStructure
//    for i in 0..<ladderLegStructure.count {
//        for j in 0..<ladderLegStructure[i].count {
//            if j % 2 == 0 {
//                completedLadderStructure[i][j] = "|"
//            } else if completedLadderStructure[i][j].isEmpty == true {
//                completedLadderStructure[i][j] = " "
//            }
//        }
//    }
//    return completedLadderStructure
//}
/// 사다리 발판 정보를 토대로 완성된 사다리구조 만들기
// 완성된 사다리구조 만들기
func completedLadderStructure(_ ladderLegStructure: [[String]]) -> [[String]] {
    var completedLadderStructure = ladderLegStructure
    return performLoopTwoOrderArray(completedLadderStructure)
}
// 2차원 배열에서 1차원 배열에 접근
func performLoopTwoOrderArray(_ twoOrderArray: [[String]]) -> [[String]] {
    var result = twoOrderArray
    for index in 0..<twoOrderArray.count {
        var oneOrderArray = twoOrderArray[index]
        result[index] = accessElementOfOneOrderArray(oneOrderArray)
    }
    return result
}
// 1차원 배열의 index 요소에 접근하는 함수
func accessElementOfOneOrderArray(_ oneOrderArray: [String]) -> [String] {
    var result = oneOrderArray
    for index in 0..<oneOrderArray.count {
        result[index] = insertLadderString(result, index)
    }
    return result
}
// 사다리의 "|"와 " " 문자열 삽입
func insertLadderString(_ oneOrderArray: [String], _ index: Int) -> String {
    switch index % 2 == 0 {
    case true:
        return "|"
    case false where oneOrderArray[index].isEmpty == true:
        return " "
    default:
        return oneOrderArray[index]
    }
}
/// Output
/// 2차원 배열 결과로 생성된 사다리를 출력하는 함수

// output two order ladder array at console
func printLadder(_ completedLadderStructure: [[String]]) {
    for i in 0..<completedLadderStructure.count {
        print(completedLadderStructure[i].joined())
    }
}

// main function
func main() {
    let personNumber = getInputPersonNum()
    let ladderHeight = getInputLadderHeight()
    let blankOneOrderArray = makeBlankOneOrderArr(personNumber)
    let blankTwoOrderArray = makeBlankTwoOrderArr(blankOneOrderArray, ladderHeight)
    let ladderLegStructure = accessTwoOrderArray(blankOneOrderArray, blankTwoOrderArray)
    let completedLadder = completedLadderStructure(ladderLegStructure)
    printLadder(completedLadder)
}

// call main function
main()
