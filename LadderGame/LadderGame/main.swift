//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func makeARow() -> String {
    // 랜덤으로 가로줄 생성
    let isExistent: Bool = arc4random_uniform(2) == 0 ? true : false
    guard  isExistent == true else{ return  " " }
    return "-"
}

func printLadder (_ numberOfParticipant: Int, _ heightOfLadder: Int) {
    var (numberOfParticipant, heightOfLadder) = (numberOfParticipant, heightOfLadder)
    //전체줄 수 생성루프 (사다리 갯수만큼 생성)
    while 0 < heightOfLadder {
        // 안쪽 가로선 및 가로선 우측선 랜덤생성 <첫째줄은 이미 생성되기 떄문에 사람 수 -1)
        for _ in 0..<numberOfParticipant-1 {
            print("ㅣ", terminator: makeARow())
        }
        // 외곽선(전체 줄) 생성
        print("ㅣ")
        heightOfLadder -= 1
    }
}

ladderLoop : while (true) {
    print("참여할 사람은 몇 명 인가요?")
    // 사람수 입력값 바인딩 / 입력값 없거나 Int타입이 아닐경우 종료
    guard let numberOfPeople = readLine(),
                 let numberOfParticipant = Int(numberOfPeople) else {break}
    print("최대 사다리 높이는 몇 개인가요?")
    // 사다리
    // 입력값 바인딩 / 입력값 없거나 Int타입이 아닐경우 종료
    guard let countOfLadder = readLine(),
                 let numberOfLadder = Int(countOfLadder) else {break}
    // 사다리 출력함수 호출
    printLadder(numberOfParticipant, numberOfLadder)
}
