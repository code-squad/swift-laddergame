//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//
//  Modified by Jamie.

import Foundation

do {
    var inputView = InputView()
    try inputView.execute()
    let ladder = inputView.ladderGame.makeLadder()
    let resultView = ResultView(ladder:ladder)
    resultView.print(ladder: ladder, players: inputView.ladderGame.playerNames)
} catch InputError.outOfNameLength {
    print("참여자 이름은 다섯글자 이하로 입력해주세요.")
} catch InputError.invalidType {
    print("숫자를 입력해주세요.")
}
