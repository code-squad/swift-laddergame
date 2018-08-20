//
//  main.swift
//  laddergame
//
//  Created by KIMMINSIK on 2018. 7. 22..
//  Copyright © 2018년 KIMMINSIK. All rights reserved.
//
import Foundation

//사다리 게임 메인 -> main
func radderGameMain () {
    let inputView = InputView()
    
    let playersName =  inputView.inputUserData()
    let maxLadderHeight = inputView.inputLadderLength()
    let inputValues = (playersName, maxLadderHeight)
    
    let ladderGame = LadderGame(input: inputValues)
    let ladder = ladderGame.makeLadderElements()
    
    let resultView = ResultView(input: ladder)
    resultView.printLadder()
    resultView.printNames(ladderGame.players)
    
}

// 실행 -> main
radderGameMain()
