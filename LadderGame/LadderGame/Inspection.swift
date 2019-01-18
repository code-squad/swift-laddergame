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
    case lackValue
    case wrongValue
    var description: String {
        switch self {
        case .lackValue: return "1 이상의 숫자를 입력해주세요"
        case .wrongValue: return "잘못된 값입니다."
        }
    }
}

struct Inspection {
    // inspect a except case

    static func inspectExcept(_ ladders: [Bool], _ index: Int) -> Bool {
        guard index > 0 && ladders[index - 1] == true else {
            return LadderGame.makeRandom()
        }
        return false
    }

    static func meetMinimum(_ people: String, _ ladder: String) throws -> (people: Int, ladder: Int) {
        // confirm a Int type
        guard let participant = Int(people),
            let height = Int(ladder) else {
                throw inputError.wrongValue
        }
        guard participant >= 1 && height >= 1 else {
                throw inputError.lackValue
        }
        return (participant, height)
    }
}
