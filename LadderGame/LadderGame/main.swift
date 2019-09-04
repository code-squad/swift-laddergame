//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

struct Player {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    func displayName() -> String {
        return self.name
    }
}

struct LadderGame {
    var players: [Player]
    var heightOfLadders: Int
    
    var ladders: Array<Array<Bool>> = []
    
    init(players: [Player], heights: Int) {
        self.players = players
        self.heightOfLadders = heights
    }
    
    mutating func makeLadders() {
        for _ in 1...heightOfLadders {
            var line : Array<Bool> = []
            for _ in players {
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
                    print(" ----- ", terminator: "")
                } else {
                    print("       ", terminator: "")
                }
                print("|", terminator: "")
            }
            print("")
        }
        for player in players {
            print("\(player.displayName())", terminator: "")
        }
        print("")
    }
}

func seperatePlayerName(names: String?) -> [Player] {
    let nameToSplit = names ?? "a,b,c,d,e"
    let names = nameToSplit.split(separator: ",")
    
    var players: [Player] = []
    for name in names {
        players.append(Player(name:String(name)))
    }
    return players
}
    
print("참여할 사람의 이름을 쉼표화 함께 입력해주세요")
let inputNames = readLine()
//let players = Int(inputNames ?? "a, b, c, d, e") ?? 0
let players = seperatePlayerName(names: inputNames)

print("최대 사다리 높이는 몇 개인가요?")
let height = readLine()
let numberOfHeights = Int(height ?? "0") ?? 0

var game = LadderGame(players: players, heights: numberOfHeights)
game.makeLadders()
game.printLadders()




