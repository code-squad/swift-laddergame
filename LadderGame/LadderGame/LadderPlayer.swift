//
//  LadderPlayer.swift
//  LadderGame
//
//  Created by TaeHyeonLee on 2017. 10. 23..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderPlayer {
    private let name : String
    
    init(name: String) {
        self.name = name
    }
    
    var getName: String {
        return self.name
    }
}
