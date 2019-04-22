//
//  LadderStep.swift
//  LadderGame
//
//  Created by BLU on 2019. 4. 19..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderStep {
    let parts: [Bool]
    
    /// 사다리 발판을 생성합니다.
    ///
    /// - Parameter width: 발판의 길이 unsigned int
    init(length: UInt) {
        var parts: [Bool] = []
        var isLadderPartEmpty = true
        
        for _ in 0..<length {
            isLadderPartEmpty = LadderPart.getStatus(isLadderPartEmpty)
            parts.append(isLadderPartEmpty)
        }
        self.parts = parts
    }
}
