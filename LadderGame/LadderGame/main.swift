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
    let resultView : ResultView = ResultView()
    gamePlay.setPlayersName(playerNames: inputView.repeatUntilRightUserNameInput())
    gamePlay.setLadderHeight(ladderHeight: inputView.repeatUntilRightHeightInput())
    gamePlay.setLadder(height: gamePlay.height)
    resultView.printLadder(ladderHeight: gamePlay.height, ladder: gamePlay.ladder)
    resultView.printPlayersName(names: gamePlay.names)
}

main()
