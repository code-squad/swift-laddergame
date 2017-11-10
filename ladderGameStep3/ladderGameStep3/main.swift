//
//  main.swift
//  ladderGameStep3
//
//  Created by Choi Jeong Hoon on 2017. 11. 6..
//  Copyright © 2017년 JH Factory. All rights reserved.
//

import Foundation

while (true) {
    let inputView = InputView()
    // 1-1. 인풋뷰의 입력값 받는 메소드를 호출하여 튜플 상수에 대입
    let inputValues = inputView.getUserInput()
    if inputValues.0.count == 0 || inputValues.1 == 0 {
        break
    }
    let userInputs = LadderGame(inputValues: inputValues)
    let resultView = ResultView(userInputs)
    resultView.printFullLadder(names: userInputs.participant, height: userInputs.height)
}

