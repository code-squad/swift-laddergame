//
//  main.swift
//  LadderGame
//
//  Created by Joon-ho Kil on 04/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum LadderChecker:Int {
    case made = 1
    case notMade = 0
}


func inputFromUser () -> (Int, Int) {
    print("참여할 사람은 몇 명 인가요?")
    let optionalHuman = readLine()
    print("최대 사다리 높이는 몇 개인가요?")
    let optionalHeight = readLine()
    
    var human = 0
    var height = 0
    
    if let stringHuman = optionalHuman {
        human = Int(stringHuman)!
    }

    if let stringHeight = optionalHeight {
        height = Int(stringHeight)!
    }
    
    return (human, height)
}

func ladderMake (_ humanNumber: Int, _ heightMax: Int) -> [[String]] {
    var ladderCheck:ladderChecker
    var ladder : [[String]] = Array(repeating: Array(repeating: "",count:humanNumber ), count: heightMax)
    
    for heightIndex in 0..<heightMax {
        for humanIndex in 0..<humanNumber {
            ladderCheck = ladderChecker(rawValue: Int(arc4random_uniform(2)))!
            switch ladderCheck {
            case .made :
                ladder[heightIndex][humanIndex] = "-"
            case .noMade :
                ladder[heightIndex][humanIndex] = " "
            }
        }
    }
    
    return ladder
}

func ladderPrint (_ ladder:[[String]]) -> () {
    let heightMax = ladder.count
    let humanNumber = ladder[0].count
    
    for heightIndex in 0..<heightMax {
        for humanIndex in 0..<humanNumber {
            print("|", terminator: "")
            print(ladder[heightIndex][humanIndex], terminator: "")
        }
        print("|")
    }
}

func ladderGame() {
    var humanNumber, heightMax:Int
    (humanNumber, heightMax) = inputFromUser()
    let ladder = ladderMake(humanNumber, heightMax)
    ladderPrint(ladder)
}

ladderGame()

