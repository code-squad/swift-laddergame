//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    var numberOfPlayers : Int
    var heightOfLadders : Int
    var ladders : Array<Array<Bool>> = []
    var playerNames : Array<Substring> = []
    
    init(names: String?, height: Int) {
        
        if names != nil {
            playerNames = names!.split(separator: ",")
            numberOfPlayers = playerNames.count
        } else {
            numberOfPlayers = 0
        }
        
       heightOfLadders = height
        
    }
    
    mutating func makeLadders() {
        if numberOfPlayers == 0 || heightOfLadders == 0 {
            return
        }
        for _ in 1...heightOfLadders {
            var line : Array<Bool> = []
            for _ in 1..<numberOfPlayers {
                let random = Int.random(in: 0...1)
                line.append(random == 1)
            }
            ladders.append(line)
        }
    }
    
    func printLadders() {
        
        for line in ladders {
            print("|", terminator: "")
            for step in line {
                if step {
                    print("-----", terminator: "")
                } else {
                    print("     ", terminator: "")
                }
                print("|", terminator: "")
            }
            print("")
        }
        
        for name in playerNames {
            print("\(name)", terminator: "\t")
        }
        print("")

    }
}

print("Input names of players?")
let names = readLine()

print("Input height?")
let height = readLine()
let heightOfLadders = Int(height ?? "0")

var game = LadderGame(names: names, height: heightOfLadders ?? 0)
game.makeLadders()
game.printLadders()
