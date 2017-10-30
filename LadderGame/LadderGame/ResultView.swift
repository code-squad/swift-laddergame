//
//  ResultView.swift
//  LadderGame
//
//  Created by Eunjin Kim on 2017. 10. 27..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {
    
    func printLadder(nameOfPlayers: [LadderPlayer], heightForLadder: Int){
        for _ in 0..<heightForLadder {
            printLadderBar(numberOfPlayer: nameOfPlayers.count)
            print()
        }
    }
    
    func printLadderBar(numberOfPlayer: Int){
        for index in 0..<numberOfPlayer {
            printLadderStep(index: index)
            print("|", terminator: "")
        }
    }
    
    func printLadderStep(index: Int){
        let randomValue = makeRandomValue()
        for _ in 0..<5 where index > 0 {
            print(randomValue, terminator: "")
        }
        if index == 0 {
            print("  ", terminator: "")
        }
    }
    
    func makeRandomValue() -> String {
        let randomValue = arc4random_uniform(2)
        if randomValue == 0 {
            return " "
        }else {
            return "-"
        }
    }
    
    func printPlayersName(nameOfPlayers: [LadderPlayer]){
        for player in nameOfPlayers {
            print(String(player.name + "  "), terminator: "")
            //format:"%-5s", 
        }
    }
}
