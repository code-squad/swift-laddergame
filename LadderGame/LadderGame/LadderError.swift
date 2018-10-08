//
//  LadderError.swift
//  LadderGame
//
//  Created by Jun ho Lee on 2018. 10. 7..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation


enum LadderGameError: String {
    case none
    case nilValue
    case wrongHeight
    case exceedNameCharactors
    
    func message() -> String {
        switch self {
        case .nilValue: return "Error: 값이 손상되었습니다."
        case .wrongHeight: return "Error: 높이값을 확인해주세요(0<h<\(Int.max))"
        case .exceedNameCharactors: return "Error: 이름 최대 길이는 5글자입니다."
        case .none: return "정상 입력입니다."
            }
        }
    }

