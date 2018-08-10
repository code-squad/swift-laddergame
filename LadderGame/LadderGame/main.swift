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
    let ladderGame = LadderGame()
    let resultView = ResultView()

    let playersName =  inputView.inputUserData()
    let maxLadderNumber = inputView.inputLadderLength()

    let ladder:String = ladderGame.createLadder(playersName, maxLadderNumber)
    let names = ladderGame.createNames(playersName)
    
    resultView.printLadder(ladder, names)
}

// 실행 -> main
radderGameMain()
