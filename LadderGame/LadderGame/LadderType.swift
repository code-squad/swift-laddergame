//
//  LadderType.swift
//  LadderGame
//
//  Created by Yoda Codd on 2018. 4. 3..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

/// 사다리 종류를 품는 열거형.
enum  LadderType : String {
    // 가로 사다리
    case side = "-"
    // 세로 사다리
    case up = "|"
    // 가로사다리(공백)
    case none = " "
    // 게임 시작시 맨 처음에 추가되는 값
    case startSpace = "  "
}
