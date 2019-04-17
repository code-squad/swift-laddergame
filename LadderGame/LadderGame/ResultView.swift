//
//  OutputView.swift
//  LadderGame
//
//  Created by 이동영 on 16/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView{
    
    func outputAll(players:[LadderPlayer],ladder:[Row]){
        output(players: players)
        output(ladder: ladder)
        print()
    }
    func output(players:[LadderPlayer]){
        print(" ",separator: "",terminator: "")
        _ = players.map{
            player in print(player.getName(),separator: "",terminator: " ")
        }
    }
    func output(ladder:[Row]){
        _ = ladder.map{
            row in
            output(row: row)
        }
    }
    func output(row:Row){
        print("\n",separator: "",terminator: "   |")
        _ = row.map {
            step in print(step.getPattern(),separator: "",terminator: "|")
        }
    }
}

