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
    let playerNames = ladderPlayer.readNames()
    let playerNumber = playerNames.count
    let ladderHeight = ladderPlayer.readLadderHeight()
    
    var ladderBoardDraw = ladderBoard(playerNumber,ladderHeight)
    ladderBoardDraw.markAsmuchWidthLadderNumber()
    let ladders = ladderBoardDraw.drawLadder()
    
    var nameBoardDraw = NameBoard()
    let nameBoard = nameBoardDraw.drawPlayerNameBoard(playerNumber,playerNames)
    
    var print = resultPrint()
    print.playPrint(ladders,nameBoard)
}

playLadderGame()
