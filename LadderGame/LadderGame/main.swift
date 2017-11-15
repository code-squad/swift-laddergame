
//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

var flag : Bool = true

var inputView = InputView()
var checkingInput = CheckingInput()
var gameOption : GameOption

while(flag == true) {
    do {
        gameOption = try checkingInput.checkValidInput(inputView.userInput())
        let ladderGame = LadderGame(gameOption)
        let ladderInfo : LadderInfo = ladderGame.genarateLadder()
        let result = ResultView(ladderInfo)
        result.printMainLadder()
        flag = false
    } catch CheckingInput.InputError.emptyNames {
        print(CheckingInput.InputError.emptyNames.rawValue)
    } catch CheckingInput.InputError.emptyHeight {
        print(CheckingInput.InputError.emptyHeight.rawValue)
    } catch CheckingInput.InputError.wrongSeparator {
        print(CheckingInput.InputError.wrongSeparator.rawValue)
    } catch CheckingInput.InputError.wrongHeight {
        print(CheckingInput.InputError.wrongHeight.rawValue)
    }
}

