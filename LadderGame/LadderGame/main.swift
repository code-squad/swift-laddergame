//
//  main.swift
//  LadderGame
//
//  Created by Joon-ho Kil on 04/09/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum ladderStruct:Int {
    case made = 1
    case noMade = 0
}

func onlyNumberPrint() {
    print("숫자만 입력해주세요.")
    inputFromUser()
    exit(0)
}

func inputFromUser () -> (Int, Int) {
    print("참여할 사람은 몇 명 인가요?")
    let optionalN = readLine()
    print("최대 사다리 높이는 몇 개인가요?")
    let optionalM = readLine()
    
    var n = 0
    var m = 0
    
    if let stringN = optionalN {
        if let stringM = optionalM {
            n = Int(stringN)!
            m = Int(stringM)!
        } else {
            onlyNumberPrint()
        }
    } else {
        onlyNumberPrint()
    }
    
    return (n, m)
}

func ladderMake (_ humanNumber: Int, _ heightMax: Int) -> [[String]] {
    var ladderCheck:ladderStruct
    var ladder : [[String]] = Array(repeating: Array(repeating: "",count:humanNumber ), count: heightMax)
    
    for i in 0..<heightMax {
        for j in 0..<humanNumber {
            ladderCheck = ladderStruct(rawValue: Int(arc4random_uniform(2)))!
            switch ladderCheck {
            case .made :
                ladder[i][j] = "-"
            case .noMade :
                ladder[i][j] = " "
            }
        }
    }
    
    return ladder
}

func ladderGame() {
    var humanNumber, heightMax:Int
    (humanNumber, heightMax) = inputFromUser()
    let ladder = ladderMake(humanNumber, heightMax)
    
}

ladderGame()
