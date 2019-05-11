//
//  ladderDrawError.swift
//  LadderGame
//
//  Created by 이희찬 on 11/05/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum LadderDrawError:Error {
    case playerNumberOverRange
    case ladderHeightOverRange
    case unknownError
    
    var description: String{
        switch self {
        case .playerNumberOverRange:
            return "플레이어 수가 범위를 초과했습니다. 200명 이하를 입력해 주세요."
        case .ladderHeightOverRange:
            return "사다리 높이가 범위를 초과했습니다. 200 이하의 높이를 입력해 주세요."
        case .unknownError:
            return "알수없는 에러"
        }
    }
}
