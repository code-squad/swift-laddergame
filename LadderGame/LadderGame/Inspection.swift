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

    static func inspectExcept(_ ladders: [LadderStep], _ index: Int) -> Bool {
        guard index > 0 && ladders[index - 1].step == true else {
            return LadderGame.makeRandom()
        }
        return ladders[index].step
    }
    
    /**
     check whether or not the minimum length value is met. If not meet, throw error.
     
     - parameters:
         - names: names of player
     
             *e.g) ["hngfu", "justin", "NORI"]*
     
    */
    static func meetLength(of names: [String]) throws {
        let isExceed = names.allSatisfy({ $0.trimmingCharacters(in: .whitespacesAndNewlines).count <= 5 })
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
    static func meetMinimum(_ player: String, _ ladder: String) throws -> (names: [String], ladder: Int) {
        let names = LadderGame.extract(player)
        guard let height = Int(ladder) else {
            throw inputError.wrongValue
        }
        guard [player].count >= 1 && height >= 1 else {
            throw inputError.lackValue
        }
        return (names, height)
    }
}
