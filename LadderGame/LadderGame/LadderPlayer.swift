//
//  LadderPlayer.swift
//  LadderGame
//
//  Created by Daheen Lee on 12/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderPlayer {
    let name: String
    
    init(of name: String) {
        // maximum length of name is 5
        self.name = String(name.prefix(5))
    }
}
