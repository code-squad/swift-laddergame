//
//  main.swift
//  ladderGameStep3
//
//  Created by Choi Jeong Hoon on 2017. 11. 6..
//  Copyright © 2017년 JH Factory. All rights reserved.
//

import Foundation

// 프로그램 구현함수
func excuteLadderGame () {
    var inputView = InputView()
    let (names,height) = inputView.getUserInput()
    let ladderGame = LadderGame(inputView: inputView)
    let resultView = ResultView(ladderGame: ladderGame)
    resultView.printFullLadder(colOf: names.count, rowOf: height)
}

excuteLadderGame()
