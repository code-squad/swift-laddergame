//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.


import Foundation

func main(){
    let game = LadderGame()
    let output = PrintView()
    let completedLadder = game.completeWholeLadder()
    output.orderPlayerNames(players: game.inputValue.players)
    output.printWholeLine(wholeLadder: completedLadder)
}

main()
