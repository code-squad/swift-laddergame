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
    if inputValues.0.count == 0 || inputValues.1 == 0 {
        break
    }
    let userInputs = LadderGame(inputValues: inputValues)
    let resultView = ResultView(userInputs)
    resultView.printFullLadder()
}

