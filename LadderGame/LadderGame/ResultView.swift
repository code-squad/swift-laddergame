//
//  ResultView.swift
//  ladderCony
//
//  Created by Elena on 18/10/2018.
//  Copyright © 2018 elena. All rights reserved.
//

import Foundation

struct ResultView {
    
    private var ladderTwoLine: [[Int]]
    
    init(ladderTwoLine: [[Int]] ) {
        self.ladderTwoLine = ladderTwoLine
    }
    
    func rowPrint(_ row: [Int]) {
        for index in row {
            index == 1 ? print("-----",terminator:"|") : print("     ", terminator : "|")
        }
    }
    
    func printLadder(_ ladderTwoLine : [[Int]]) {
        for index in ladderTwoLine {
            print("   ",terminator:"|")
            rowPrint(index)
            print("")
        }
    }
    func addBlank(_ name: String)-> String {
        var number = name
        for i in 0..<(5 - number.count + 1) {
            i % 2 != 0 ? number.insert(" ", at: number.endIndex) : number.insert(" ", at: number.startIndex)
        }
        return number
    }
    func printPlayers(_ players: [LadderPlayer]){
        print(players.map{addBlank($0.name)}.joined())
    }
}






