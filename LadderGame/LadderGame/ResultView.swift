//
//  ResultView.swift
//  laddergame
//
//  Created by 김수현 on 2017. 12. 20..
//  Copyright © 2017년 김수현. All rights reserved.
//

import Foundation

struct ResultView {
    
    func drawHorizontalLadder(_ ladders: [[String]]) {
        for height in 0..<ladders.count {
            drawVerticalLadder(ladders[height])
        }
    }
    
    func drawVerticalLadder(_ heightOfLadders: [String]) {
        for player in heightOfLadders {
            print("|" + player, terminator:"")
        }
        print("|")
    }
    
    func printBlank(_ nameLength: Int) -> String {
        var blank = " "
        var times = 5 - nameLength
        for _ in 0..<times {
            blank += " "
        }
        return blank
    }
    
    func printPlayers(_ players: Int,_ playerName: String,_ playerNameLength: Int) {
        let blank = printBlank(playerNameLength)
        print(playerName, terminator: blank)
    }
}

