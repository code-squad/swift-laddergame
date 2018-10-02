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
    do {
        let playerNames = InputView(guideMessage: .playerNames).getInput()
        let maxHeight = InputView(guideMessage: .maxHeight).getInput()
        try Validator.throwInputError(names:playerNames, height:maxHeight)
        let ladderGame = LadderGame(height: maxHeight, names: playerNames)
        ResultView.printGame(ladderGame.getLadderGameDTO())
    }
    catch InputError.noPlayer { return }
    catch InputError.outOfNameLength { return }
    catch InputError.notIntMoreThanTwo { return }
    catch { return }
}

execute()

