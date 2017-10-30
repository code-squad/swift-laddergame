//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main(){
    
    //show prompt
    var inputView = InputView()
    inputView.prompt()
 
    //initialized
    var ladderGame = LadderGame(height: inputView.getHeightForLadder())
    let players = ladderGame.seperateNameOfPlayers(inputValue: inputView.getNameOfPlayers())    
    ladderGame.makePlayerObject(players: players)

    
    //print ladder
    let resultView = ResultView(ladderGame: ladderGame)
    resultView.printLadder(nameOfPlayers: ladderGame.getNames(), heightForLadder: ladderGame.getHeight())
    
    //print players name
    resultView.printPlayersName(nameOfPlayers: ladderGame.getNames())
    print()
    
}
main()
