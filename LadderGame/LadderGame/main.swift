//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

print("hello JK")


struct LadderGame {
    var namesOfPlayers: [LadderPlayer]
    var heightOfLadder: Int
    var ladders: Array<Array<Bool>> = []
    
    init(players: [LadderPlayer], heights: Int) {
        namesOfPlayers = players
        heightOfLadder = heights
    }
    
    mutating func makeLadders() {
        for _ in 1...heightOfLadder {
            
            var line: Array<Bool> = []
            
            for _ in 1...namesOfPlayers.count {
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
        for player in namesOfPlayers {
            print(player.name, terminator: "  ")
        }
    }
}


print("참여할 사람 이름을 입력하세요")

let players = readLine()
let namesOfPlayers = players?.split(separator: ",") ?? []
let convertedPlayers = namesOfPlayers.map { LadderPlayer(name: String($0)) }

print("최대 사다리 높이는 몇 개인가요?")

let heights = readLine()
let heightOfLadders = Int(heights ?? "0") ?? 0


var game = LadderGame(players: convertedPlayers, heights: heightOfLadders)
game.makeLadders()
game.printLadders()



