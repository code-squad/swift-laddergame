//
//  Validator.swift
//  LadderGame
//
//  Created by 윤지영 on 2018. 9. 28..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

public enum InputError: Error {
    case notIntType
    case lessThan2
    case outOfNameLength
}

struct Validator {
    static private let maxLength = 5
    
    static private func isOutOfLength(names:String) -> Bool {
        for name in names.split(separator: ",") {
            if(name.count > maxLength) { return false }
        }
        return true
    }
    
    static func isValid(names:String) throws {
        guard isOutOfLength(names: names) else {
            print("참여자 이름은 다섯글자 이하로 입력해주세요.")
            throw InputError.outOfNameLength
        }
    }
    
    static func isValid(height:String) throws {
        guard let heightInt = Int(height) else {
            print("최대 사다리 높이는 숫자로 입력해주세요.")
            throw InputError.notIntType
        }
        guard heightInt > 1 else {
            print("최대 사다리 높이는 2 이상으로 입력해주세요.")
            throw InputError.lessThan2
        }
    }
    
}
