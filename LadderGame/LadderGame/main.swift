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
    var ladderGame = LadderGame(height: inputView.heightForLadder!)
    let players = ladderGame.seperateNameOfPlayers(inputValue: inputView.nameOfPlayers!)
    
    for name in players {
        var ladderPlayer = LadderPlayer()
        ladderPlayer.name = name
        ladderGame.names.append(ladderPlayer)
    }
    
    //print ladder
    let resultView = ResultView()
    resultView.printLadder(nameOfPlayers: ladderGame.names, heightForLadder: ladderGame.height)
    
    //print players name
    resultView.printPlayersName(nameOfPlayers: ladderGame.names)
    print()
    
}
main()
