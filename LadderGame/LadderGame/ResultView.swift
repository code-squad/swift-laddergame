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
    var index: Int
    
    init(ladderGame: LadderGame) {
        self.ladderGame = ladderGame
        self.index = 0
    }
    
    mutating func printLadder(){
        for _ in 0..<ladderGame.height {
            printLadderBar(numberOfPlayer: ladderGame.names.count)
            print()
        }
    }
    
    private mutating func printLadderBar(numberOfPlayer: Int){
        print("  ", terminator: "")
        for column in 0..<numberOfPlayer {
            printLadderStep(column: column)
            print("|", terminator: "")
        }
    }
    
    private mutating func printLadderStep(column: Int){
        //get random value
        let RandomValue = ladderGame.randomValue.flatMap({$0}).map({(value: Int) -> String in
            if value == 1 {
                return "-"
            }else {
                return " "
            }
        })
        
        //print step
        for _ in 0..<5 where column > 0{
            print(RandomValue[index], terminator: "")
        }
        self.index += 1
    }
    
    func printPlayersName(){
        for player in ladderGame.names {
            print(player.getName(), terminator: "  ")
        }
    }
}
