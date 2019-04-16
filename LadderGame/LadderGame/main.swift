//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

///시작 함수
func main() throws {
    let userInput = try InputView()
    let ladderGame = LadderGame(players: userInput.players, height: userInput.ladderHeight)
    ResultView.printLadder(ladderGame: ladderGame)
}

do {
    try main()
} catch InputError.invalidInput {
    print("입력 오류")
} catch InputError.invalidPlayerCount {
    print("사람 수 오류")
} catch InputError.invalidPlayerName {
    print("사람 이름 오류")
} catch InputError.invalidLadderHeight {
    print("사다리 높이 오류")
}
