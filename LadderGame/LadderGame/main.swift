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
    var playerNames:[LadderPlayer] = []
    var playerNumber:Int = 0
    var ladderHeight:Int = 0
    readUserInput(.nameOfPlayer)
    
    var ladderBoardDraw = ladderBoard(playerNumber,ladderHeight)
    do{
        try ladderBoardDraw.ladderHeightCheck()
        try ladderBoardDraw.playerNumberCheck()
    }catch let error as LadderDrawError{
        print(error.description)
    }catch{
        print(LadderDrawError.unknownError.description)
    }
    ladderBoardDraw.markLadder()
    
    var print = resultPrint()
    print.playPrint(playerNames,playerNumber,ladderHeight,ladderBoardDraw.widthLadderIsExistence)
}

playLadderGame()


