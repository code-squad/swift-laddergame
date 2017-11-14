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
    if inputValues.0.contains("q") {
        break
    }
    let check = CheckingValue()
    do {  // try = 에러잡기, catch = 에러잡았을때 행동
        let checkedValues = try check.returnResultOfChecking(inputValues.0, inputValues.1)
        let userInputs = LadderGame(inputValues: checkedValues)
        let resultView = ResultView(userInputs)
        resultView.printFullLadder()
    } catch  let error as CheckingValue.ErrorMessage {
        print(error.rawValue)
    }
}

