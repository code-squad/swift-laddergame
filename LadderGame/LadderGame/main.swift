//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

print("Hello world1")

struct LadderPlayer {
    let name : String
}

struct LadderGame {
    var heightOfLadders: Int
    
    var players: Array<LadderPlayer> = []
    var ladders: Array<Array<Bool>> = []

    init(players: Array<LadderPlayer>, heightOfLadders: Int) {
        self.players = players
        self.heightOfLadders = heightOfLadders
    }
    
    mutating func makeLadders() {
        for _ in 1...heightOfLadders {
            var line : Array<Bool>  = []
            for _ in 1..<players.count {
                let random = Int.random(in: 0...1)
                line.append(random==1)
            }
            ladders.append(line)
        }
    }
    
    func printLadder() {
        
        for line in ladders {
            print("|", terminator: "")
            for step in line {
                if step {
                    print("----", terminator: "")
                }
                else {
                    print("    ", terminator: "")
                }
                print("|", terminator: "")
            }
            print("")
        }
        
        for player in players {
            print("\(player.name) ", terminator: "")
        }
        print("")
    }
}

print("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)")
let inputedPlayers = readLine()

let names = inputedPlayers!.split(separator: ",")
var playNames: Array<LadderPlayer> = []
for name in names {
    
    playNames.append(LadderPlayer(name: String(name)))
}

print("최대 사다리 높이는 몇개인가요?")
let height = readLine()
let heightOfLadder = Int(height ?? "0") ?? 0

var ladderGame = LadderGame(players: playNames, heightOfLadders: heightOfLadder)
ladderGame.makeLadders()
ladderGame.printLadder()

