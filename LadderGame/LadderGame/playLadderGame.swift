//
//  playLadderGame.swift
//  LadderGame
//
//  Created by 이희찬 on 18/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct PlayLadderGame {
    func requestNumber()->Int{
        let input = UserInputManage()
        let userResponse = input.convertInt(input.removeOptional(input.requestNumber))
        return userResponse
    }
    func playerNumberRequest()->Int{
        print("플레이어 수를 입력하세요")
        let playerNumber = requestNumber()
        return playerNumber
    }
    
    func ladderHeightRequest()->Int{
        print("사다리 높이를 입력하세요")
        let ladderHeight = requestNumber()
        return ladderHeight
    }
    
    func userInputRequest()->Array<Int>{
        let playerNumber = playerNumberRequest()
        let ladderHeight = ladderHeightRequest()
        return [playerNumber,ladderHeight]
    }
    
    func drawLadder(_ input:Array<Int>){
        var ladder = LadderGameValue(playerNumber:input[0],ladderHeight:input[1])
        ladder.addHeight()
        ladder.addWidth()
        ladder.resultprint()
    }
    
    func startLaddergame(){
        let playerNumberAndLadderHeight = userInputRequest()
        drawLadder(playerNumberAndLadderHeight)
    }
}
