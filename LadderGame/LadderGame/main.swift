//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//
//  Modified by Jamie.

import Foundation

func execute() {
    
    let playerNames = InputView(guideMessage: .playerNames).getInput()
    let maxHeight = InputView(guideMessage: .maxHeight).getInput()
    let inputError = Validator.checkInputError(names: playerNames, height: maxHeight)
    
    guard inputError == .noError else {
        print(inputError.rawValue)
        return
    }
    
    let ladderGame = LadderGame(height: maxHeight, names: playerNames)
    ResultView.printGame(ladderGame.getLadderGameDTO())
}

execute()

