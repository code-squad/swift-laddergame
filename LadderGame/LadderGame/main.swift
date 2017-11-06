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
    inputView.separateNameOfPlayers()
 
    //initialized
    let ladderGame = LadderGame(inputView: inputView)
    
    //print ladder
    var resultView = ResultView(ladderGame: ladderGame)
    resultView.printLadder()
    
    //print players name
    resultView.printPlayersName()
    print()
}
main()
