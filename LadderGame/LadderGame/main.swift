//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.


import Foundation

func handleError(input: InputView) -> Bool {
    let inputedPlayers = input.getPlayers()
    let inputedHeight = input.getHeight()
    let inputError = input.checkInputValue(players: inputedPlayers, height: inputedHeight)
    if  inputError != LadderGameError.none {
        print(inputError.message())
        return true
    }
    return false
}

func main(){
    let input = InputView()
    if handleError(input: input) {return}
    let game = LadderGame(players: input.getPlayers(), height: input.getHeight())
    let output = PrintView()
    let completedLadder = game.completeWholeLadder()
    output.orderPlayerNames(players: game.players)
    output.printWholeLine(wholeLadder: completedLadder)
}

main()
