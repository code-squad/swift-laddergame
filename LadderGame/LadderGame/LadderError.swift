//
//  LadderError.swift
//  LadderGame
//
//  Created by Jun ho Lee on 2018. 10. 7..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation


enum LadderGameError: Error {
    case nillValue
    case wrongHeight
    case exceedNameCharactors
    
    func message() -> String {
        switch self {
        case .nillValue :
            return "오류가 발생했습니다"
        case .wrongHeight :
            return "높이값을 확인해주세요(숫자만 입력가능)"
        case .exceedNameCharactors :
            return "이름 최대 길이는 5글자입니다."
            }
        }
    }
