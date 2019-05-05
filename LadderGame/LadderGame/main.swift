//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

//게임 실행하는 함수
func playGame() {
    
    let inputView = InputView()
    var ladderGame = LadderGame()
    var resultView = ResultView()
    
    
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
   
    //참여자 인원수
    var playCount = Int()
    
    //입력 예외처리
    let checkLadder = inputView.inputUserLadderCount(messageType: Message.ladderNum)
    do {
        try showLabberError(chladderNum: checkLadder)
            
    } catch UserInputError.incorrectLadderData {
        exit(0)
    } catch {
        print("모든상황에러")
    }
    playCount = checkLadder
    
    //사다리 만들기
    let horizontal = ladderGame.processingGame(playerNames: playerNames, playCount: playCount)
    //사다리 출력 (세로 사다리 "|" 붙여서)
    resultView.showLadders(ladders: horizontal)
    //참여자 이름 출력 (사다리 아래에 이름 붙이기)
    resultView.showPlayerName(playerName: playerNames)
}

playGame()
