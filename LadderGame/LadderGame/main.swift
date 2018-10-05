//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.


import Foundation

func main(){
    let input = InputView()
    let game = LadderGame(players: input.getPlayers(), height: input.getHeight())
    let output = PrintView()
    let completedLadder = game.completeWholeLadder()
    output.orderPlayerNames(players: game.players)
    output.printWholeLine(wholeLadder: completedLadder)
}

main()
