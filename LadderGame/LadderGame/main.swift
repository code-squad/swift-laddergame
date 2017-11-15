
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
var gameOption : GameOption

while(flag == true) {
    do {
        gameOption = try inputView.userInput()
        let ladderGame = LadderGame(gameOption)
        let ladderInfo : LadderInfo = ladderGame.genarateLadder()
        let result = ResultView(ladderInfo)
        result.printMainLadder()
        flag = false
    } catch InputView.InputError.emptyNames {
        print(InputView.InputError.emptyNames.rawValue)
    } catch InputView.InputError.emptyHeight {
        print(InputView.InputError.emptyHeight.rawValue)
    } catch InputView.InputError.wrongSeparator {
        print(InputView.InputError.wrongSeparator.rawValue)
    } catch InputView.InputError.wrongHeight {
        print(InputView.InputError.wrongHeight.rawValue)
    }
}

