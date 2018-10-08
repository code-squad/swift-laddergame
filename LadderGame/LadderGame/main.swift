//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main(){
    var gamePlay : LadderGame = LadderGame()
    let inputView : InputView = InputView()
    gamePlay.setPlayersName(playerNames: inputView.repeatUntilRightUserNameInput())
    gamePlay.setLadderHeight(ladderHeight: inputView.repeatUntilRightHeightInput())
    gamePlay.setLadder(height: gamePlay.height)
    gamePlay.printLadder()
    gamePlay.printPlayersName()
}

main()
