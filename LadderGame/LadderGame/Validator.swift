//
//  Validator.swift
//  LadderGame
//
//  Created by 윤지영 on 2018. 9. 28..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

public enum InputError : String {
    case noError
    case noPlayer = "참여자를 입력해주세요."
    case notIntMoreThanTwo = "최대 사다리 높이는 2 이상의 정수로 입력해주세요."
    case outOfNameLength = "참여자 이름은 다섯글자 이하로 입력해주세요."
}

struct Validator {
    static private let maxLength = 5
    
    static func isMoreThanOnePlayerAtLeast(names:String) -> Bool {
        return names.split(separator: ",").count > 0
    }
    
    static func isWithinLength(names:String) -> Bool {
        for name in names.split(separator: ",") {
            if(name.count > maxLength) { return false }
        }
        return true
    }
    
    static func isIntMoreThanTwo(height:String) -> Bool {
        guard let heightInt = Int(height) else { return false }
        guard heightInt > 1 else { return false }
        return true
    }
    
    static func checkInputError(names:String,height:String) -> InputError {
        guard isMoreThanOnePlayerAtLeast(names:names) else { return .noPlayer }
        guard isWithinLength(names:names) else { return .outOfNameLength }
        guard isIntMoreThanTwo(height:height) else { return .notIntMoreThanTwo }
        return .noError
    }
    
}
