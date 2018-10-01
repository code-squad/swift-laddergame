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
    case outOfNameLength
}

struct Validator {
    static private let maxLength = 5
    
    static private func isValid(names:String) -> Bool {
        for name in names.split(separator: ",") {
            if(name.count > maxLength) { return false }
        }
        return true
    }
    
    static func checkValidate(height:String, names:String) throws {
        guard isValid(names: names) else {
            print("참여자 이름은 다섯글자 이하로 입력해주세요.")
            throw InputError.outOfNameLength
        }
        guard let _ = Int(height) else {
            print("최대 사다리 높이는 숫자로 입력해주세요.")
            throw InputError.notIntType
        }
    }
    
}
