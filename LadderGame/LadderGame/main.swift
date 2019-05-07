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
    do{
        playerNames = try ladderPlayer.readNames()
        playerNumber = playerNames.count
        ladderHeight = try ladderPlayer.readLadderHeight()
    }catch let error as InputError{
        print(error.description)
    }catch{
        print("알 수 없는 에러")
    }
    
    var ladderBoardDraw = ladderBoard(playerNumber,ladderHeight)
    ladderBoardDraw.markAsmuchWidthLadderNumber()
    let ladders = ladderBoardDraw.drawLadder()
    
    var nameBoardDraw = NameBoard()
    let nameBoard = nameBoardDraw.drawPlayerNameBoard(playerNumber,playerNames)
    
    var print = resultPrint()
    print.playPrint(ladders,nameBoard)
}

playLadderGame()
