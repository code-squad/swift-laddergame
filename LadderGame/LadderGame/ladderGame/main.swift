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
    let inputValues = inputView.getUserInput()
    if inputValues.names.contains("q") {
        break
    }
    // 예외처리 (에러메세지 출력) : try = 에러잡기, catch = 에러잡았을때 행동
    do {
        let checkedValues = try CheckingValue().returnResultOfChecking(inputValues.names, inputValues.heightOfLadder)
        let userInputs = LadderGame(inputValues: checkedValues)
        let resultView = ResultView(userInputs)
        resultView.printFullLadder()
    } catch let error as CheckingValue.ErrorMessage {
        print (error.rawValue)
    }
}
