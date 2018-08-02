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
    let resultView = ResultView()
    
    let inputUserName =  inputView.inputUserData()
    let playerNumber = inputUserName
    let inputMaxLadderNumber = inputView.inputLadderLength()
    let maxLadderNumber = inputMaxLadderNumber
    let createLadder = resultView.ladderFrameCreate(playerNumber!, maxLadderNumber)

}
// 실행 -> main
radderGameMain()
