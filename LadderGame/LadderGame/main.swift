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
    let guideMessage = ["참여할 사람의 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)","최대 사다리 높이는 몇 개인가요?"]
    do {
        let playerNames = InputView(guideMessage: guideMessage[0]).getInput()
        let maxHeight = InputView(guideMessage: guideMessage[1]).getInput()
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

