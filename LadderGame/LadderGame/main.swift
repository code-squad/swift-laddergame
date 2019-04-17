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
    var height: Int = 0
    
    do {
        player = try input.readNames()
        height = try input.readHeight()
    } catch let err as UserInputError {
        print(err.description)
    } catch {
        print("알 수 없는 에러")
    }
    
    let ladderGame = LadderGame.init(names: player, height: height)
    let result = ResultView.init(game: ladderGame, numberOfStep: 5)
    result.drawLadder()
}

startGame()
