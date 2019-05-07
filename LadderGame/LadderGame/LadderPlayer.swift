//
//  LadderPlayer.swift
//  LadderGame
//
//  Created by BLU on 2019. 4. 19..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderPlayer {
    private(set) var name: String
    
    init?(name: String) {
        guard 1...5 ~= name.count else {
            return nil
        }
        self.name = name
    }
}
