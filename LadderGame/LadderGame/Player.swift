//
//  Player.swift
//  LadderGame
//
//  Created by 이동건 on 17/07/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderPlayer {
    private let name: String
    
    var displayableName: String {
        get {
            return self.name
        }
    }
    
    init(name: String) {
        self.name = name
    }
}
