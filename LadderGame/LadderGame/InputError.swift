//
//  InputError.swift
//  LadderGame
//
//  Created by BLU on 2019. 4. 18..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

/// 사용자 입력 에러 타입 정의
enum InputError: Error {
    // 입력이 없음
    case isEmpty
    // 정수형이 아님
    case notANumber
    // 유효하지 않은 범위
    case invalidNumber
}
