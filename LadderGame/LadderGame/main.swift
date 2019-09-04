//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    var playernames : Array<Substring>
    var heightOfLadders : Int
    
    var ladders : Array<Array<Bool>> = []
    
    init(name: Array<Substring>, height:Int) {
        playernames = name
        heightOfLadders = height
    }
    
    mutating func makeLadders(){
        for _ in 1...heightOfLadders {
            var line : Array<Bool> = []
            for _ in 1...playernames.count-1{
                let random = Int.random(in: 0...1)
                line.append(random == 1)
            }
            ladders.append(line)
        }
    }
    
    func printLadders(){
        for line in ladders{
            print("|", terminator: "")
            for step in line {
                if step {
                    print("-----", terminator: "")
                }else{
                    print("     ", terminator: "")
                }
                print("|", terminator: "")
            }
            print("")
        }
        for name in playernames {
//            if name.count > 5{
//                let index = name.index(name.startIndex, offsetBy: 5)
//                name.substring(to: index)
//            }
            print("\(name) ", terminator: "")
        }
        print("")
    }
}
print("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)")
let players = readLine()
let names = players?.split(separator: ",") ?? Array<Substring>()

print("최대 사다리 높이는 몇 개인가요?")
let heights = readLine()
let heightOfLadders = Int(heights ?? "0") ?? 0

var game = LadderGame(name: names, height: heightOfLadders)
game.makeLadders()
game.printLadders()
