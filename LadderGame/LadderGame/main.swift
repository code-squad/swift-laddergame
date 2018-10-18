//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.


import Foundation

//에러 처리 함수
func isError(players: [LadderPlayer], height: Int) -> Bool {
    let nameError = LadderGameError.checkNameError(players: players)
    let heightError = LadderGameError.checkHeightError(height: height)
    let playerCountError = LadderGameError.checkPlayerError(players: players)
    switch (nameError, heightError, playerCountError) {
    case (ErrorCase.exceedNameCharactors, _, _) :
        print(nameError.message()); return true
    case (_, ErrorCase.wrongHeight, _) :
        print(heightError.message()); return true
    case (_, _, ErrorCase.lackPlayers) :
        print(playerCountError.message()); return true
    default : return false
    }
}

func main(){
    let input = InputView()
    let stringNames = input.getNames()
    let players = input.getPlayers(stringNames: stringNames)
    let height = input.getHeight()
    if isError(players: players, height: height) {return}
    let game = LadderGame()
    let output = PrintView()
    let completedLadder = game.completeWholeLadder(players: players, height: height)
    let playerLine = output.orderPlayerNames(players: players)
    let drawnLine = output.drawWholeLine(wholeLadder: completedLadder)
    output.printResult(gameElements:  playerLine, drawnLine)
}

main()
