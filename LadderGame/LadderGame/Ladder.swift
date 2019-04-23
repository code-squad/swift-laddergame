//
//  Ladder.swift
//  LadderGame
//
//  Created by JieunKim on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Ladder {
    private var Layer = [LadderFloor]()
    public func getLayer()-> [LadderFloor] {
        return Layer
    }
    
    init(numberOfPlayer: Int, ladderLayer: Int) {
        for _ in 0..<ladderLayer {
            Layer.append(LadderFloor.init(numberOfPlayer: numberOfPlayer))
        }
    }
}
