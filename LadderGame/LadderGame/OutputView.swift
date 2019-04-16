//
//  OutputView.swift
//  LadderGame
//
//  Created by 이동영 on 16/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct OutputView{
    
    func outputAll(players:[LadderPlayer],ladder:[Row]){
        output(players: players)
        output(ladder: ladder)
    }
    func output(players:[LadderPlayer]){
        _ = players.map{
            player in print(player.getName(),separator: "",terminator: "\t")
        }
    }
    func output(ladder:[Row]){
        _ = ladder.map{
            row in
            output(row: row)
        }
    }
    func output(row:Row){
        print("\n",separator: "",terminator: "|")
        _ = row.map {
            step in print(step.getPattern(),separator: "",terminator: "|")
        }
    }
}

