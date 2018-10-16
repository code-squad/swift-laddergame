//
//  checkUserInput.swift
//  LadderGame
//
//  Created by 윤동민 on 2018. 10. 16..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct CheckUserInput{
    // 플레이어의 네임이 제대로 한 명도 입력되지 않은 경우 False 리턴
    static func isRightUserNameInput(userNames: [LadderPlayer]) -> Bool{
        guard userNames.count == 0 else {
            return true
        }
        return false
    }
    
    // 사용자의 사다리 높이 입력 값을 검사
    static func isRightUserHeightInput(input: Int) -> Bool{
        guard input > -1 else {
            return false
        }
        return true
    }
}
