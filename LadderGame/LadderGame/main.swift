//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderPlayer {
    let name: String
    init(playerName: String) {
        name = playerName
    }
}

struct LadderGame {
    var playerNames: [LadderPlayer]
    var heightOfLadders: Int
    
    var ladders : Array<Array<Bool>> = []
    
    init(players: [LadderPlayer], ladders: Int) {
        playerNames = players
        heightOfLadders = ladders
    }
    
    //mutating <- 함수가 모델의 인자의 값을 바꿔 줄 수 있다
    
    mutating func makeLadders() {
        for _ in 1...heightOfLadders {
            var line : Array<Bool> = []
            for _ in 1..<playerNames.count {
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
                    print("------", terminator: "")
                }
                else {
                    print("      ", terminator: "")
                }
                print("|", terminator: "")
            }
            print("")
        }
    }
    
    func printPlayers() {
        for playerName in playerNames {
            print("\(playerName.name) ", terminator: "")
        }
        print("")
    }
}

print("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)")
let inputName = readLine()
var players: Array<LadderPlayer> = []
let names = inputName?.split(separator: ",") ?? []
for name in names {
    players.append(LadderPlayer(playerName: String(name)))
}

print("최대 사다리는 몇 개 인가여?")
let heights = readLine()
let heightOfLadders = Int(heights ?? "0") ?? 0

var game = LadderGame(players: players, ladders: heightOfLadders)
game.makeLadders()
game.printLadders()
game.printPlayers()
