//
//  main.swift
//  laddergame
//
//  Created by KIMMINSIK on 2018. 7. 22..
//  Copyright © 2018년 KIMMINSIK. All rights reserved.
//

import Foundation

//사다리 게임 메인
func radderGameMain () {
    
    inputLaddergameData()
}

//참여할 사람, 사타리 높이 정하기
func inputLaddergameData () {
    //참여할 인원 입력 받음
    print("참여할 사람은 몇 명 인가요?")
    let inputUserNumber = readLine()
    //최대 사다리 높이 입력 받음
    print("최대 사다리 높이는 몇 개인가요?")
    let inputMaxLadderNumber = readLine()
    var createLadder = ladderCreater(inputUserNumber!, inputMaxLadderNumber!)
}


//사다리 생성
func ladderCreater(_ userNumber:String, _ maxLadderNumber:String) {
    var createFrame = [[String]](repeating: Array(repeating: "|", count: Int(userNumber)!), count : Int(maxLadderNumber)!)
    
    for createFrame in createFrame {
        for createFrame in createFrame {
            print(createFrame, terminator: ladderRowCreater())
        }
        print("")
    }
}

//가로줄 사다리 생성
func ladderRowCreater() -> String {
    let rowCreate: Bool = arc4random_uniform(2) == 0 ? true : false
    guard rowCreate == true else {
        return  " " }
    
    return "-"
}

// 실행
radderGameMain()

