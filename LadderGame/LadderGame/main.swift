//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func playLadderGame() {
    var userInput = UserInputManage()
    let (playerNumber,ladderHeight) = userInput.DrawInitMember()
    
    var ladderDraw = Draw(playerNumber,ladderHeight)
    ladderDraw.markWidthAsmuchWidthLadderNumber()
    ladderDraw.allHeightLadderDraw()
    ladderDraw.allWidthLadderDraw()
    playPrint(ladderDraw.drawLadders)
}

playLadderGame()
