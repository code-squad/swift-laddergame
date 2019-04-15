//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation


enum UserInputError: Error {
    case incorrectFormat
    case emptyValue
    case negativeValue
}

enum Question: String {
    case player = "참여할 사람의 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)"
    case height = "최대 사다리 높이는 몇 개인가요?"
}

func startGame() throws {
    let input = InputView()
    let player = try input.readNames()
    let height = try input.readHeight()
    let ladderGame = LadderGame(names: player, height: height)
    let result = ResultView(ladderGame: ladderGame)
    result.ladder.drawLadder()
    result.printNames()
}

do {
    try startGame()
} catch UserInputError.emptyValue {
    print("dsds")
} catch UserInputError.incorrectFormat {
    print("ddddd")
} catch UserInputError.negativeValue {
    print("-")
} catch {
    print("???")
}
