//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

//참여할 사람 입력 받기
func inputUserData () -> String {
    print("참여할 사람은 몇 명 인가요?")
    let inputUserNumber = readLine()
    return inputUserNumber!
}

//사다리 높이 정하기
func inputLadderLength () -> String {
    print("최대 사다리 높이는 몇 개인가요?")
    let inputMaxLadderNumber = readLine()
    return inputMaxLadderNumber!
}

// 출력 함수
func printLadder(_ playerNumber: Int) {
    for _ in 0..<playerNumber-1 {
        print("ㅣ", terminator: ladderRowCreater())
    }
}

// 사다리 프레임 생성
func ladderFrameCreater(_ playerNumber: Int, _ maxLadderNumber: Int) {
    var maxLadderNumber = maxLadderNumber
    
    while 0 < maxLadderNumber {
        printLadder(playerNumber)
        print("ㅣ")
        maxLadderNumber -= 1
    }
}
//가로줄 사다리 생성
func ladderRowCreater() -> String {
    let rowCreate: Bool = arc4random_uniform(2) == 0 ? true : false
    guard rowCreate == true else {
        return  " " }
    
    return "-"
}

//사다리 게임 메인
func radderGameMain () {
    let inputUserNumber = inputUserData()
    let playerNumber = Int(inputUserNumber) // 입력 값 Int로 바꾸기
    let inputMaxLadderNumber = inputLadderLength()
    let maxLadderNumber = Int(inputMaxLadderNumber) // 입력 값 Int로 바꾸기
    let createLadder = ladderFrameCreater(playerNumber!, maxLadderNumber!)
}

// 실행
radderGameMain()
