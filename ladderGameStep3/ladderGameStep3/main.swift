//
//  main.swift
//  ladderGameStep3
//
//  Created by Choi Jeong Hoon on 2017. 11. 6..
//  Copyright © 2017년 JH Factory. All rights reserved.
//

import Foundation

/*
 LadderGame 인스턴스로 userInputs를 만들고, ResultView(userInputs)에 넘겨서 resultView 인스턴스를 만들었는데
 printFullLadder()에 또 매개변수로 userInputs 속성을 넘기네요.
 위에 넘긴 userInputs을 재활용하거나 아래 매개변수가 있으니 위에 안 넘겨도 될 것 같은데... 둘 중에 어떤걸 수정하는게 좋을까요?
 */


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

