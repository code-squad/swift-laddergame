//
//  LadderStep.swift
//  LadderGame
//
//  Created by BLU on 2019. 4. 19..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

/// 사다리 발판 구조체
struct LadderStep {
    private let isEmpty: Bool
    private(set) var type: Type
    
    /// 발판 타입 정의
    ///
    /// - empty: 비어 있음
    /// - bar: 가로 기둥
    enum `Type`: String {
        case empty = "     "
        case bar = "-----"
    }
    
    init(_ isEmpty: Bool) {
        self.isEmpty = isEmpty
        self.type = isEmpty ? .empty : .bar
    }
}
