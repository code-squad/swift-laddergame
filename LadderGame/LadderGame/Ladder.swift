//
//  Ladder.swift
//  LadderGame
//
//  Created by JieunKim on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Ladder {
    
    // internal getter, private setter
    // Layer가 선언된 파일 내에서만 값 수정
    // 외부에서는 값 수정 불가능
    // 반면 값을 얻는 것은 모듈 내에서는 어디서든 할 수 있다.
    // private(set) var Layer: [LadderFloor] = []
    private var Layer: [LadderFloor] = []
    
    public func getLayer()-> [LadderFloor] {
        return Layer
    }
    
    
    init(numberOfPlayer: Int, ladderLayer: Int) {
        
        for _ in 0..<ladderLayer {
            Layer.append(LadderFloor.init(numberOfPlayer: numberOfPlayer))
        }
    }
}
