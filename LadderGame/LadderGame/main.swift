//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//
//  Forked and dev by HW on 09/04/2019

import Foundation

/// 2차원 사다리 문자열 배열의 print 함수
func printLadder(ladderString2dArray :  [[String]]) -> Void {
    for ( rowItems) in ladderString2dArray {
        for ( columnItem) in rowItems {
            print("\(columnItem)", terminator: "")
        }
        print ("")
    }
}

/// 2차원 사다리 문자열 배열 초기화 함수
func initLadder(numOfPeople: Int, numOfLadders: Int) -> [[String]] {
    let numOfColumn = numOfPeople * 2 - 1
    let numOfRow = numOfLadders
    let initialLadder = [[String]] (repeating: Array(repeating: "|", count: numOfColumn), count: numOfRow)
    return initialLadder
}

/// 2진 랜덤 숫자 생성기 -> 0이면 false, 1이면 true 리턴
func binaryRandomGenerate() -> Bool {
    let binaryRange:UInt32 = 2
    return (Int(arc4random_uniform(binaryRange))) == 0 ? false : true
}
/// 2차원 사다리 문자열 생성 함수
func  buildLadder (ladderInt2dArray : [[String]]) -> [[String]] {
    var resultLadder = ladderInt2dArray
    ///가로 사다리
    let horizontalLadder: String = "-"
    ///사다리 없음
    let emptyLadder: String = " "

    /// stride를 사용한 방식
    for (rowIndex, rowItems) in ladderInt2dArray.enumerated() {
        let byIndex: Int = 2
        for columnIndex in stride(from: 1, to: rowItems.count, by: byIndex) {
            /// 이진 난수생성에 기반한 Bool값으로 사다리 놓을지 여부 정하기
            let isLadderOn: Bool = binaryRandomGenerate()
            if isLadderOn {
                resultLadder[rowIndex][columnIndex] = horizontalLadder
            }else{
                resultLadder[rowIndex][columnIndex] = emptyLadder
            }
        }
    }
    return resultLadder
}

/// 입력 함수
func inputPairNumber() -> (Int, Int){
    ///`n` 명의 사람
    print("참여할 사람은 몇 명 인가요? (자연수 입력)")
    guard let n: String = readLine()
        else{
            print("유효한 값을 입력하세요")
            return (-1, -1)
    }
    let people:Int = (n as NSString).integerValue

    ///`m` 개의 m 높이의 사다리
    print("최대 사다리 높이는 몇 개인가요? (자연수 입력)")
    guard let m: String = readLine()
        else{
            print("유효한 값을 입력하세요")
            return (-1, -1)
    }
    let ladders: Int = (m as NSString).integerValue
    return (people, ladders)
}

/// 시작 함수
func startLadderGame() -> Void {
    let (people, ladders) = inputPairNumber()
    if people > 1 && ladders > 1 {
        let initialLadder: [[String]] = initLadder(numOfPeople: people, numOfLadders: ladders)
        let resultLadder: [[String]] = buildLadder (ladderInt2dArray : initialLadder)
        printLadder(ladderString2dArray: resultLadder)
    }else{
        print("유효한 입력값을 넣어주세요 (인원, 높이 각각 2이상) \n. 양의 실수값 입력시 정수로 내림 처리됩니다.")
    }
}
/// 사다리 게임 시작
startLadderGame()
