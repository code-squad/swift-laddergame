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
    
    var playerList : [LadderPlayer]
    repeat{
        playerList = inputView.splitUserInputName(userInput: inputView.inputJoinPlayersName())
    }while !inputView.isRightUserNameInput(userNames: playerList)
    gamePlay.setPlayersName(playerNames: playerList)
    
    var heightOfLadder : Int
    repeat{
        heightOfLadder = inputView.inputLadderOfHeight()
    }while !inputView.isRightUserHeightInput(input: heightOfLadder)
    gamePlay.setLadderHeight(ladderHeight: heightOfLadder)
    
    gamePlay.setLadder(height: gamePlay.height)
    resultView.printLadder(ladderHeight: gamePlay.height, ladder: gamePlay.ladder)
    resultView.printPlayersName(names: gamePlay.names)
}

main()
