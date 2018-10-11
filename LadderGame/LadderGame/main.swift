//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.


import Foundation

//에러 처리 함수
func handleError(players: [LadderPlayer], height: Int) -> Bool {
    let Error = LadderGameError(players: players, height: height)
    let inputError = Error.checkInputError(players: players, height: height)
    if  inputError != LadderGameError.ErrorCase.none {
        print(inputError.message())
        return true
    }
    return false
}


func main(){
    let input = InputView()
    let players = input.getPlayers()
    let height = input.getHeight()
    if handleError(players: players, height: height) {return}
    let game = LadderGame(players: players, height: height)
    let output = PrintView()
    let completedLadder = game.completeWholeLadder()
    output.printPlayerNames(players: players)
    output.printWholeLine(wholeLadder: completedLadder)
}

main()
