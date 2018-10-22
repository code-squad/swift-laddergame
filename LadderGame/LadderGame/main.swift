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
    guard let personNum = readLine() else {
        return 0
    }
    guard let person = Int(personNum) else {
        return 0
    }
    return person
}
/// 2) 사다리높이 입력받는 함수
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

// make two order array for ladder leg information
func makeLadderLegInformation(_ blankTwoOrderArray: [[String]]) -> [[String]] {
    var ladderLegInformation = blankTwoOrderArray
    for i in 0..<blankTwoOrderArray.count {
        for j in 0..<blankTwoOrderArray[i].count {
            if j % 2 != 0 {
                if getRandomValue(j*100) == true {
                    ladderLegInformation[i][j] = "-"
                }
            }
        }
    }
    return ladderLegInformation
}
// make random value
func getRandomValue(_ num: Int) -> Bool {
    if Int(arc4random_uniform(UInt32(num))) % 2 == 0 {
        return true
    } else {
        return false
    }
}
// make completed ladder structure
func completedLadderStructure(_ ladderLegStructure: [[String]]) -> [[String]] {
    var completedLadderStructure = ladderLegStructure
    for i in 0..<ladderLegStructure.count {
        for j in 0..<ladderLegStructure[i].count {
            if j % 2 == 0 {
                completedLadderStructure[i][j] = "|"
            } else if completedLadderStructure[i][j].isEmpty == true {
                completedLadderStructure[i][j] = " "
            }
        }
    }
    return completedLadderStructure
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
    let blankTwoOrderArray = Array(repeating: Array(repeating: "", count: personNumber*2-1), count: ladderHeight)
    let ladderLegStructure = makeLadderLegInformation(blankTwoOrderArray)
    let completedLadder = completedLadderStructure(ladderLegStructure)
    printLadder(completedLadder)
}

// call main function
main()
