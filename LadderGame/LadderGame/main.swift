//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

enum inputError: Error {
    case wrongType
    case unknown
}

func check(type: String) throws -> Int {
    guard let result = Int(type) else {
        throw inputError.wrongType
    }
    return result
}

func countPeople() throws -> Int {
    print("참여할 사람은 몇명인가요?(ex: 3): " , terminator: " ")
    guard let participate = readLine() else {
        throw inputError.unknown
    }
    return try check(type: participate)
}

func countLadder() throws -> Int {
    print("최대 사다리의 높이는 몇개인가요?(ex: 5): " , terminator: " ")
    guard let countLadder = readLine() else {
        throw inputError.unknown
    }
    return try check(type: countLadder)
}

func isLadder() -> Bool {
    if arc4random_uniform(2) == 0 {
        return false
    } else {
        return true
    }
}



func main() {
    
}

main()
