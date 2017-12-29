//
//  LadderGame.swift
//  laddergame
//
//  Created by 김수현 on 2017. 12. 20..
//  Copyright © 2017년 김수현. All rights reserved.
//

import Foundation

struct LadderGame {
    var height = 0
    var name: [LadderPlayer]
    var number = 0
    
    init(_ heightOfLadder: Int,_ playerName: [String],_ playerNumber: Int) {
        var names = [LadderPlayer]()
        for n in playerName {
            let tempName = LadderPlayer(name: n)
            names.append(tempName)
        }
        self.name = names
        self.height = heightOfLadder
        self.number = playerNumber
    }
    
    func generateLadders(_ player: Int,_ heightOfLadder: Int) -> [[String]] {
        var ladders = [[String]](repeating: Array(repeating: " ", count: player-1), count: heightOfLadder)
        return ladders
    }
    
    func addHorizontalLadder(_ height: [[String]]) -> [[String]] {
        var lines = height
        for horizontal in 0..<lines.count {
            let result = addVerticalLadder(lines[horizontal])
            lines[horizontal] = result
        }
        return lines
    }
    
    func addVerticalLadder(_ player: [String]) -> [String] {
        var ladders = player
        for vertical in 0..<ladders.count {
            ladders[vertical] = getNumberOfLadder()
        }
        return ladders
    }
    
    func isHaveLadders() -> Bool {
        let randomNum: UInt32 = arc4random_uniform(2)
        let numOfLadder = Int(randomNum)
        guard numOfLadder == 1 else { return false }
        return true
    }
    
    func getNumberOfLadder() -> String {
        let ishaveladder = isHaveLadders()
        let ladders = "-----"
        let blank = "     "
        guard isHaveLadders() else { return blank }
        return ladders
    }

    
    
}

