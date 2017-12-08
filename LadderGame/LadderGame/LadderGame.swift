//
//  LadderGame.swift
//  LadderGame
//
//  Created by jack on 2017. 12. 4..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//
// 사다리 높이 속성과 참여자를 Array로 포함하는 구조체

import Foundation

struct LadderGame {
    
     var height = 0
     var names : [LadderPlayer]
    
    init(namesVal : [String], heightVal : Int) {
        var playerNames = [LadderPlayer]()
        for oneName in namesVal  {
            let playerName = LadderPlayer(name: oneName)
            playerNames.append(playerName)
        }
        self.names = playerNames
        self.height = heightVal
    }

    func generateFrameOfLadder (entryVal : Int, heightVal : Int) -> [[Bool]] {
        let setOfLadder : [[Bool]] = Array(repeatElement(Array(repeatElement(false, count: entryVal - 1)), count: heightVal))
        return setOfLadder
    }
    
    func makeRandomHorizontalLine (_ makeVal : Bool) -> Bool {
        let RandomNum : UInt32 = arc4random_uniform(2)
        return !(makeVal == false || RandomNum == 0)
    }
    func generateString (_ length : Int, char : Character) -> String {
        var temp = ""
        for _ in 0...length {
            temp += String(char)
        }
        return temp
    }

    func generateOneFloorOfLadder (oneFloorOfLadder : [Bool]) -> [Bool] {
        var temp = oneFloorOfLadder
        for index in 0..<oneFloorOfLadder.count {
            if index == 0 || temp[index - 1] != true {
              temp[index] = makeRandomHorizontalLine(true)
              continue
            }
            temp[index] = makeRandomHorizontalLine(false)
        }
        return temp
    }
    
    func generateRandomLadder (frameOfLadder : [[Bool]]) -> [[Bool]] {
        var randomLadder = frameOfLadder
        for index in 0..<frameOfLadder.count {
            randomLadder[index] = generateOneFloorOfLadder(oneFloorOfLadder: frameOfLadder[index])
        }
        return randomLadder
    }

}
