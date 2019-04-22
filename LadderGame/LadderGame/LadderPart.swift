//
//  LadderPart.swift
//  LadderGame
//
//  Created by BLU on 2019. 4. 22..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

/// 사다리 부품 타입 정의
enum LadderPart: Character {
    case rung = "|"
    case bar = "-"
    case empty = " "
    
    init(_ isEmpty: Bool) {
        self = isEmpty ? .empty : .bar
    }
    
    /// 다음 사다리 부품의 상태를 가져옵니다.
    /// - parameter isEmpty: true 혹은 flase
    /// - returns: true 혹은 false
    static func getStatus(_ isEmpty: Bool) -> Bool {
        return isEmpty ? Bool.random() : true
    }
}
