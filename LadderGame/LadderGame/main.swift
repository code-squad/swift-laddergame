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
    if nameError == ErrorCase.exceedNameCharactors {
        print(nameError.message()); return true
    }
    let heightError = LadderGameError.checkHeightError(height: height)
    if heightError == ErrorCase.wrongHeight {
        print(heightError.message()); return true
    }
    let playerCountError = LadderGameError.checkPlayerError(players: players)
    if playerCountError == ErrorCase.lackPlayers {
        print(playerCountError.message()); return true
    }
    return false
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
    output.orderPlayerNames(players: players)
    output.drawWholeLine(wholeLadder: completedLadder)
}

main()
