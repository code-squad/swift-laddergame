//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main(){
    var gamePlay = LadderGame()
    gamePlay.setPlayersName(userInput: gamePlay.inputJoinPlayersName())
    gamePlay.setLadderHeight(ladderHeight: gamePlay.inputLadderOfHeight())
    guard gamePlay.isRightUserInput(input: gamePlay.height) else{
        return
    }
    gamePlay.setLadder(height: gamePlay.height)
    gamePlay.printLadder()
    gamePlay.printPlayersName()
}

main()
