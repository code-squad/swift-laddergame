//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func playLadderGame() {
    var ladderPlayer = Inputview()
    ladderPlayer.readNames()
    ladderPlayer.readLadderHeight()
    
    var ladderBoardDraw = ladderBoard(ladderPlayer.playerNumber,ladderPlayer.ladderHeight)
    ladderBoardDraw.markAsmuchWidthLadderNumber()
    let ladders = ladderBoardDraw.drawLadder()
    
    var nameBoardDraw = NameBoard()
    let nameBoard = nameBoardDraw.drawPlayerNameBoard(ladderPlayer.playerNumber,ladderPlayer.playerNames)
    
    var print = resultPrint()
    print.playPrint(ladders,nameBoard)
}

playLadderGame()
