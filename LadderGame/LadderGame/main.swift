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
    
    let ladderGame = LadderGame()
    let resultView = ResultView()
    
    ladderGame.makeOneLadderLineElement(playersName.count)
    let allLadderElement = ladderGame.makeAllLadderElement(maxLadderHeight)
    resultView.printLadder(allLadderElement ,maxLadderHeight, playersName)
}

// 실행 -> main
radderGameMain()
