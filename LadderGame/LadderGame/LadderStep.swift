//
//  LadderStep.swift
//  LadderGame
//
//  Created by BLU on 2019. 4. 19..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

/// 사다리 발판 타입 정의
struct LadderStep {
    private let isEmpty: Bool
    private(set) var type: LadderPart
    
    init(isEmpty: Bool) {
        self.isEmpty = isEmpty
        self.type = isEmpty ? .empty : .bar
    }
}
