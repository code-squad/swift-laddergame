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
    private let maxLength = 5
    
    func isValid(names:String) -> Bool {
        for name in names.split(separator: ",") {
            if(name.count > maxLength) { return false }
        }
        return true
    }
    
    func checkValidate(height:String, names:String) throws {
        guard isValid(names: names) else { throw InputError.outOfNameLength }
        guard let _ = Int(height) else { throw InputError.notIntType }
    }
    
}
