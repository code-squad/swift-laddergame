//
//  main.swift
//  ladderGameStep3
//
//  Created by Choi Jeong Hoon on 2017. 11. 6..
//  Copyright © 2017년 JH Factory. All rights reserved.
//

import Foundation

while (true) {
    var inputView = InputView()
    // 1-1. 인풋뷰의 입력값 받는 메소드를 호출하여 튜플 상수에 대입
    let (participants, heightOfLadder) = inputView.getUserInput()
    let countOfNames = participants.count
    if participants.count == 0 || heightOfLadder == 0 {
        break
    }
    // 2. ResultView인스턴스 생성
    let resultView = ResultView()
    // 2-2. ResultView의 사다리정보를 출력하는 메소드 호출
    resultView.printFullLadder(row: heightOfLadder, col: countOfNames, names: participants)
}

