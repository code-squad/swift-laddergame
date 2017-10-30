//
//  ResultView.swift
//  LadderGame
//
//  Created by Eunjin Kim on 2017. 10. 27..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {
    
    var ladderGame: LadderGame
    
    init(ladderGame: LadderGame) {
        self.ladderGame = ladderGame
    }
    
    func printLadder(){
        for _ in 0..<ladderGame.height {
            printLadderBar(numberOfPlayer: ladderGame.names.count)
            print()
        }
    }
    
    private func printLadderBar(numberOfPlayer: Int){
        for index in 0..<numberOfPlayer {
            printLadderStep(index: index)
            print("|", terminator: "")
        }
    }
    
    private func printLadderStep(index: Int){
        let randomValue = ladderGame.makeRandomValue()
        for _ in 0..<5 where index > 0 {
            print(randomValue, terminator: "")
        }
        if index == 0 {
            print("  ", terminator: "")
        }
    }
    
    func printPlayersName(){
        for player in ladderGame.names {
            print(player.getName(), terminator: "  ")
        }
    }
}
