//
//  ResultView.swift
//  ladderCony
//
//  Created by Elena on 18/10/2018.
//  Copyright © 2018 elena. All rights reserved.
//

import Foundation

struct ResultView {
    
    static private let rowBridge = "-----"
    static private let colBridge = "|"
    static private let blank = "     "
    
    
    static private func rowPrint(_ row: [Bool]) {
        var result : String = ""
        for index in row {
            result.append(addBridge(index))
        }
        print(result)
    }
    
    static private func addBridge(_ index: Bool)-> String {
        if index == true {
            return rowBridge+colBridge
        }
        return blank+colBridge
    }
    
    static func printLadder(_ ladderTwoLine : [[Bool]]) {
        for index in ladderTwoLine {
            print("   ",terminator:"|")
            ResultView.rowPrint(index)
        }
    }
  
    static private func addBlank(_ name: String)-> String {
        var number = name
        for i in 0..<(5 - number.count + 1) {
            number.insert(" ",at : addBlankIndex(i,number))
        }
        return number
    }
    
    static private func addBlankIndex(_ index : Int, _ number : String) -> String.Index{
        if index % 2 != 0 {
            return number.endIndex
        }
        return number.startIndex
    }
    
    static func printPlayers(_ players: [LadderPlayer]){
        print(players.map{addBlank($0.name)}.joined())
    }
}
