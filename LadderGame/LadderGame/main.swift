//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//


import Foundation

func startGame() {
    var input = InputView()
    var players = [LadderPlayer]()
    var height: Int = 0
    
    do {
        players = try input.readNames()
        height = try input.readLayer()
    } catch let err as InputError {
        print(err.description)
    } catch {
        print("알 수 없는 에러")
    }
    
    let ladderGame = LadderGame.init(players: players, height:height)
    ResultView.drawLadder(game: ladderGame)
}

startGame()
