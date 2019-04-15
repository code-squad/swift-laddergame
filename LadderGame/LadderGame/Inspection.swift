//
//  Inspecotr.swift
//  LadderGame
//
//  Created by cushy k on 15/01/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

// set error case
enum inputError: Error {
    case wrongValue
    case lackValue
    case exceedLength
    var description: String {
        switch self {
        case .lackValue: return "1 이상의 사다리 개수와 1명 이상의 참여자를 입력해주세요"
        case .wrongValue: return "잘못된 값입니다."
        case .exceedLength: return "각 이름은 5글자까지만 입력해주세요"
        }
    }
}

struct Inspection {
    
    /**
     checks if the same value is contiguous.
     
     - parameters:
         - ladders: a ldder row has a false.
     
             *e.g) [false, false, false]*
     
     - returns
         true or false
     
    */

    func except(from ladders: [LadderStep], within index: Int) -> Bool {
        guard index > 0 && ladders[index - 1].step == true else {
            return Bool.random()
        }
        return false
    }
    
    /**
     check whether or not the minimum length value is met. If not meet, throw error.
     
     - parameters:
         - names: names of player
     
             *e.g) ["hngfu", "justin", "NORI"]*
     
    */
    func meetLength(of players: [LadderPlayer]) throws {
        let isExceed = players.allSatisfy({ $0.name.trimmingCharacters(in: .whitespacesAndNewlines).count <= 5 })
        guard isExceed else {
            throw inputError.exceedLength
        }
    }
    /**
     If input doesn't meet minimum, throw error. otherwise, return incoming value.
     
     - parameters:
         - player: String of names
     
             *e.g.) justin, oingbong, drake, cony*
     
         - ladder: A string of number of ladder
     
     - throws:
     If incoming ladder isn't number, numbers of name and ladder is below 1, it throw exception.
     
     - returns:
     A passed incoming value.
    */
    func meetMinimum(of players: [LadderPlayer], of ladder: String) throws -> (names: [LadderPlayer], ladder: Int) {
        
        guard let height = Int(ladder) else {
            throw inputError.wrongValue
        }

        let filteredNames = players.filter{ !($0.name.isEmpty) }
        guard filteredNames.count >= 1 && height >= 1 else {
            throw inputError.lackValue
        }
        return (players, height)
    }

    /**
     Check whether Consecutive line has

     - parameters:
         - ladders: array of bool

         *e.g) [false, false, true]
     - returns:
         If it had consecutive lines, return true. otherwise, return false.
     */

    func verifyChain(from ladders:[LadderStep]) -> Bool {
        for index in 0..<ladders.count-1 {
            guard !(ladders[index].step && ladders[index + 1].step) else {
                return true
            }
        }
        return false
    }
}
