//
//  ResultView.swift
//  LadderGame
//
//  Created by Eunjin Kim on 2017. 10. 27..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {
    private var height = 0
    private var names : [LadderPlayer] = []
    private var index: Int
    private var storedRandomValue: [[Int]] = [[]]
    
    init(ladderGame: LadderGame) {
        height = ladderGame.height
        names = ladderGame.names
        storedRandomValue = ladderGame.randomValue
        self.index = 0
    }
    
    mutating func printLadder(){
        for row in 0..<height {
            printLadderBar(row: row)
            print()
        }
    }
    
    private mutating func printLadderBar(row: Int){
        for column in 0..<names.count {
            printLadderStep(row: row, column: column)
            print("|", terminator: "")
        }
    }
    
    private mutating func printLadderStep(row: Int, column: Int){
        let randomValue = storedRandomValue[row][column]
        let value: String

        if randomValue == 1 && column > 0 {
            value =  "-----"
        }else {
            value = "     "
        }
        
        print(value, terminator: "")
    }
    
    func printPlayersName(){
        print("   ", terminator: "")
        for player in names{
            print(player.getName(), terminator: "  ")
        }
    }
}
