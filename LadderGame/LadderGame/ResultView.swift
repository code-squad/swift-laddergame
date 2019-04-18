//
//  OutputView.swift
//  LadderGame
//
//  Created by 이동영 on 16/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView{
    
    let ladder : Ladder
    let players : [LadderPlayer]
   
    
    init(players:[LadderPlayer],ladder:Ladder){
        self.players = players
        self.ladder = ladder
    }
    
    func output(){
        printPlayers(self.players)
        printRows(ladder.getRows())
    }
    func printPlayers(_ players:[LadderPlayer]){
        _ = players.map{ player in print(player,separator: "",terminator: "")}
        print()
    }
    func printRows(_ rows:[LadderRow]){
        for row in rows {
            printSteps(row.getSteps())
        }
    }
    func printSteps(_ steps:[LadderStep]){
        print("  |",separator: "",terminator: "")
        _ = steps.map{
            step in
            print(step,separator: "",terminator: "|")
        }
        print()
    }
   
    
    
    
}

