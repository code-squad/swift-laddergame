//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

var inputView = InputView()
let ladderStep = LadderStep()
let ladderFloor = LadderFloor()
var ladder = Ladder()
var outputForm = OutputForm()
let ladderGame = LadderGame()




//게임 실행하는 함수
func playGame() {
    ladder.makeLadderData(peopleNum: inputView.checkPlayerError().count, ladderNum: inputView.checkLadderError())
    let data = ladder.horizontalData
    outputForm.makeHorizontalLadders(makeData: data)
    let horizontal = outputForm.horizontalLadders
    ladderGame.increaseByladderLine(ladders: horizontal)
    ladderGame.showPlayerName(playerName: inputView.playerNames)
}




//
////게임 실행하는 함수
//func playGame() {
//    let data = ladder.makeLadderData(peopleNum: inputView.checkPlayerError().count, ladderNum: inputView.checkLadderError())
//    let horizontal = ladder.makeHorizontalLadders(makeData: data)
//    ladderGame.increaseByladderLine(ladders: horizontal)
//    ladderGame.showPlayerName(playerName: inputView.playerNames)
//}

playGame()
