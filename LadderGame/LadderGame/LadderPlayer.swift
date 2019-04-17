//
//  LadderPlayer.swift
//  LadderGame
//
//  Created by 이진영 on 15/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderPlayer {
    private(set) var name: String
    
    init(name: String) throws {
        guard 1...5 ~= name.count else { throw InputError.invalidPlayerName }
        self.name = name
    }
}
