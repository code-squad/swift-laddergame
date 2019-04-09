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
    
    if human < 1 || height < 1 {
        print("참여할 사람과 최대 사다리 높이를 정확히 입력해주세요.")
    }
    
    return (human, height)
}

func ladderMake (_ input: (Int, Int)) -> [[String]] {
    var ladderCheck:LadderChecker
    let human = input.0
    let height = input.1
    var ladder : [[String]] = Array(repeating: Array(repeating: "",count:human ), count: height)
    
    for heightIndex in 0..<height {
        for humanIndex in 0..<human {
            ladderCheck = LadderChecker(rawValue: Int(arc4random_uniform(2)))!
            switch ladderCheck {
            case .made :
                ladder[heightIndex][humanIndex] = "-"
            case .notMade :
                ladder[heightIndex][humanIndex] = " "
            }
        }
    }
    
    return ladder
}

func ladderPrint (_ ladder:[[String]]) -> () {
    let height = ladder.count
    let human = ladder[0].count
    
    for heightIndex in 0..<height {
        for humanIndex in 0..<human {
            print("|", terminator: "")
            print(ladder[heightIndex][humanIndex], terminator: "")
        }
        print("|")
    }
}

func ladderGame() {
    var input = (0, 0)
    while input.0 < 1 && input.0 < 1 {
        input = inputFromUser()
    }
    let ladder = ladderMake(input)
    ladderPrint(ladder)
}

ladderGame()

