//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

struct GameController {
    
    static func executeLadderGame() {
        let inputView = InputView()
        let (namesOfPlayers, maxHeightOfLadder) = inputView.getLadderDataForGame()
        if namesOfPlayers == nil || maxHeightOfLadder == nil {
            print("잘못된 입력입니다. 프로그램이 종료됩니다.")
            return
        }
        let ladderGame = LadderGame(height: maxHeightOfLadder!, playerNames: namesOfPlayers!)
        
        
        ResultView.printLadderGame(using: ladderGame)
    }
}

GameController.executeLadderGame()
