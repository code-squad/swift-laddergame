//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//


import Foundation

func startGame() {
    let input = InputView()
    
    var player: [LadderPlayer] = []
    var Layer: Int = 0
    
    do {
        player = try input.readNames()
        Layer = try input.readLayer()
    } catch let err as InputError {
        print(err.description)
    } catch {
        print("알 수 없는 에러")
    }
    
    let ladderGame = LadderGame.init(Player: player, Layer: Layer)
    ResultView.drawLadder(game: ladderGame)
}

startGame()

//LadderFloor.init(numberOfPlayer: <#T##Int#>)
