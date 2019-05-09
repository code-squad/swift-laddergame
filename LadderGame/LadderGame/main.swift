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
        print(InputError.unknownError.description)
    }
    
    var ladderBoardDraw = ladderBoard(playerNumber,ladderHeight)
    ladderBoardDraw.markLadder()
    
    var print = resultPrint()
    print.playPrint(playerNames,playerNumber,ladderHeight,ladderBoardDraw.widthLadderIsExistence)
}

playLadderGame()


