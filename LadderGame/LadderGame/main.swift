//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

<<<<<<< HEAD
print("hello world")
=======
struct LadderPlayer {
    let name : String
    
    func displayName() -> String {
        return (NSString.init(format: "%6s", NSString(string:name).utf8String! )) as String
    }
}

struct LadderGame {
    var players = Array<LadderPlayer>()
    var heightOfLadders : Int
    var ladders : Array<Array<Bool>> = []
    
    init(playerNames: Array<String>, height: Int) {
        for name in playerNames {
            players.append(LadderPlayer(name: name))
        }
        heightOfLadders = height
    }
    
    mutating func makeLadders() {
        for _ in 1...heightOfLadders {
            var line : Array<Bool> = []
            for _ in 1...(players.count-1) {
                let random = Int.random(in: 0...1)
                line.append(random == 1)
            }
            ladders.append(line)
        }
    }
    
    func printLadders() {
        for line in ladders {
            print("    |", terminator: "")
            for step in line {
                if step {
                    print("-----", terminator: "")
                }
                else {
                    print("     ", terminator: "")
                }
                print("|", terminator: "")
            }
            print("")
        }
        for player in players {
            print(player.displayName(), terminator:"")
        }
    }
}


print("참여할 사람은 누구인가요?")
let players = readLine() // ->String?
let playerSubstrings = players?.split(separator: ",") ?? []
let playerNames = playerSubstrings.map{ String($0) }

print("최대 사다리 높이는 몇 개인가요?")
let heights = readLine()
let heightOfLadders = Int(heights ?? "0") ?? 0


var game = LadderGame(playerNames: playerNames, height: heightOfLadders)
game.makeLadders()
game.printLadders()

>>>>>>> 11672fd... Step2 요구사항 구현
