//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func playLadderGame() {
    var userInput = UserInput()
    userInput.ladderBoardInitNumber(userInput.playerNumberRequestMassage)
    let playerNumber = userInput.convertedInt
    userInput.ladderBoardInitNumber(userInput.ladderHeightRequestMassage)
    let ladderHeight = userInput.convertedInt
    
    
    var ladderDraw = ladderBoard(playerNumber,ladderHeight)
    ladderDraw.markAsmuchWidthLadderNumber()
    ladderDraw.allHeightLadderDraw()
    ladderDraw.allWidthLadderDraw()
    playPrint(ladderDraw.Ladders)
}
playLadderGame()
