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
    let players = inputView.seperateNameOfPlayers()
 
    //initialized
    let ladderGame = LadderGame(height: inputView.getHeightForLadder(), names: players)
    
    //print ladder
    let resultView = ResultView(ladderGame: ladderGame)
    resultView.printLadder()
    
    //print players name
    resultView.printPlayersName()
    print()
}
main()
