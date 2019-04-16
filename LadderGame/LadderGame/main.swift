//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

///시작 함수
func main() {
    let userInput = InputView()
    let ladderGame = LadderGame(players: userInput.players, height: userInput.ladderHeight)
    ResultView.printLadder(ladderGame: ladderGame)
}

main()
