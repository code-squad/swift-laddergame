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
    
    var playerNames = Array<String>()
    let checkPlayer = inputView.inputUserPlayerName(messageType: Message.peopleNum)
        
    do {
        try showPlayerError(chNames: checkPlayer)
            
    } catch UserInputError.overNameCount {
        exit(0)
    } catch UserInputError.incorrectPlayerData {
        exit(0)
    } catch {
        print("모든상황에러")
    }
    playerNames = checkPlayer
   
    var playCount = Int()
    let checkLadder = inputView.inputUserLadderCount(messageType: Message.ladderNum)
        
    do {
        try showLabberError(chladderNum: checkLadder)
            
    } catch UserInputError.incorrectLadderData {
        exit(0)
    } catch {
        print("모든상황에러")
    }
    playCount = checkLadder
    
    ladder.makeLadderData(peopleNum: playerNames.count, ladderNum: playCount)
    let data = ladder.horizontalData
    outputForm.makeHorizontalLadders(makeData: data)
    let horizontal = outputForm.horizontalLadders
    ladderGame.increaseByladderLine(ladders: horizontal)
    ladderGame.showPlayerName(playerName: playerNames)
}

playGame()
