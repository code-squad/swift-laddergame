//
//  ResultView.swift
//  ladderCony
//
//  Created by Elena on 18/10/2018.
//  Copyright © 2018 elena. All rights reserved.
//

import Foundation

struct ResultView {
    
    static private func rowPrint(_ row: [Bool]) {
        for index in row {
            index == true ? print("-----",terminator:"|") : print("     ", terminator : "|")
        }
    }
    
    static func printLadder(_ ladderTwoLine : [[Bool]]) {
        for index in ladderTwoLine {
            print("   ",terminator:"|")
            ResultView.rowPrint(index)
            print("")
        }
    }
    static private func addBlank(_ name: String)-> String {
        var number = name
        for i in 0..<(5 - number.count + 1) {
            i % 2 != 0 ? number.insert(" ", at: number.endIndex) : number.insert(" ", at: number.startIndex)
        }
        return number
    }
    static func printPlayers(_ players: [LadderPlayer]){
        print(players.map{addBlank($0.name)}.joined())
    }
}
